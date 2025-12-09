import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_flutter_for_hospital_at_home/viewmodels/survey_viewmodel.dart';
import '../models/survey_definition.dart';
import 'survey_question_tile.dart';

class SurveyPage extends ConsumerWidget {
  final SurveyDefinition survey;
  const SurveyPage({super.key, required this.survey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(surveyViewModelProvider(survey));

    return Scaffold(
      appBar: AppBar(
        title: Text(survey.title),
        centerTitle: true, //
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: survey.questions.length + 1,
        itemBuilder: (context, index) {
          if (index == survey.questions.length) {
            return _buildSubmitButton(ref);
          }
          return SurveyQuestionTile(
            questionIndex: index,
            question: survey.questions[index],
            selectedOption: vm.answers[index],
            showError: vm.showErrors && vm.answers[index] == null,
            onSelect: (option) {
              ref
                  .read(surveyViewModelProvider(survey).notifier)
                  .selectAnswer(index, option);
            },
          );
        },
      ),
    );
  }

  // Build Submit Button
  Widget _buildSubmitButton(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: ElevatedButton(
        onPressed: () {
          ref.read(surveyViewModelProvider(survey).notifier).submitSurvey();
        },
        child: const Text('Submit'),
      ),
    );
  }
}
