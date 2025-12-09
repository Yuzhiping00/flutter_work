import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/survey_definition.dart';
import '../models/survey_response.dart';
part 'survey_repository.g.dart';

abstract class SurveyRepository {
  Future<void> submitSurveyResponse(
    SurveyDefinition survey,
    SurveyResponse responses,
  );
}


class InMemorySurveyRepository implements SurveyRepository {
  @override
  Future<void> submitSurveyResponse(
    SurveyDefinition survey,
    SurveyResponse responses,
  ) async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 100));
    // Here you would normally send the survey responses to a backend or database
    debugPrint(
      'Survey "${survey.title}" submitted with responses: ${responses.answers}',
    );
  }
}

@riverpod
SurveyRepository surveyRepository(Ref ref) {
  return InMemorySurveyRepository();
}
