import 'package:practice_flutter_for_hospital_at_home/data/survey_repository.dart';
import 'package:practice_flutter_for_hospital_at_home/models/survey_response.dart';

import '../models/survey_definition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'survey_viewmodel.g.dart';

class SurveyState {
  final SurveyDefinition survey;
  final List<int?> answers; // null if not answered yet;
  final bool showErrors;

  SurveyState({
    required this.survey,
    required this.answers,
    this.showErrors = false,
  });

  // Helper method to create a copy with updated fields
  SurveyState copyWith({List<int?>? answers, bool? showErrors}) {
    return SurveyState(
      survey: survey,
      answers: answers ?? this.answers,
      showErrors: showErrors ?? this.showErrors,
    );
  }
}

@riverpod
class SurveyViewModel extends _$SurveyViewModel {
  // Repository instance
  late final SurveyRepository repo;
  
  // Build initial state
  @override
  SurveyState build(SurveyDefinition survey) {
    // Initialize repository
    repo = ref.watch(surveyRepositoryProvider);
    return SurveyState(
      survey: survey,
      answers: List<int?>.filled(survey.questions.length, null),
    );
  }

  // Method to select an answer for a question
  void selectAnswer(int questionIndex, int answerIndex) {
    final updatedAnswers = List<int?>.from(state.answers);
    updatedAnswers[questionIndex] = answerIndex;
    state = state.copyWith(answers: updatedAnswers);
  }

  void submitSurvey() async {
    final hasMissing = state.answers.contains(null);

    if (hasMissing) {
      state = state.copyWith(showErrors: true);
      return;
    }

    await repo.submitSurveyResponse(
      state.survey,
      SurveyResponse(answers: state.answers),
    );
  }
}
