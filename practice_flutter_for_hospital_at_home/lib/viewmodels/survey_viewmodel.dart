import 'package:practice_flutter_for_hospital_at_home/data/survey_repository.dart';
import 'package:practice_flutter_for_hospital_at_home/models/survey_response.dart';

import '../models/survey_definition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'survey_viewmodel.g.dart';

class SurveyState {
  final SurveyDefinition survey;
  final List<int?> answers;
  final bool showErrors;
  final int? scrollToIndex; // <-- View tells UI what to scroll to
  SurveyState({
    required this.survey,
    required this.answers,
    this.showErrors = false,
    this.scrollToIndex,
  });
  SurveyState copyWith({
    List<int?>? answers,
    bool? showErrors,
    int? scrollToIndex,
  }) {
    return SurveyState(
      survey: survey,
      answers: answers ?? this.answers,
      showErrors: showErrors ?? this.showErrors,
      scrollToIndex: scrollToIndex,
    );
  }
}

@riverpod
class SurveyViewModel extends _$SurveyViewModel {
  late final SurveyRepository repo;
  @override
  SurveyState build(SurveyDefinition survey) {
    repo = ref.watch(surveyRepositoryProvider);
    return SurveyState(
      survey: survey,
      answers: List.filled(survey.questions.length, null),
    );
  }

  List<int> getMissing() {
    final missing = <int>[];
    for (var i = 0; i < state.answers.length; i++) {
      if (state.answers[i] == null) missing.add(i);
    }
    return missing;
  }

  /// Called when user taps Submit
  void validateAndScroll() {
    final missing = getMissing();
    if (missing.isEmpty) {
      _submit();
      return;
    }
    // show red errors + scroll to first missing
    state = state.copyWith(
      showErrors: true,
      scrollToIndex: missing.first,
    );
  }

  void _submit() async {
    await repo.submitSurveyResponse(
      state.survey,
      SurveyResponse(answers: state.answers),
    );
  }

  /// Called when user selects an answer
  void selectAnswer(int questionIndex, int answerIndex) {
    final updated = [...state.answers];
    updated[questionIndex] = answerIndex;
    final missing = getMissing();
    state = state.copyWith(
      answers: updated,
      scrollToIndex: missing.isNotEmpty ? missing.first : null,
    );
  }

  void clearScrollFlag() {
    state = state.copyWith(scrollToIndex: null);
  }
}
