import './survey_question.dart';

class SurveyDefinition {
  final String title;
  final List<SurveyQuestion> questions;
  SurveyDefinition({required this.title, required this.questions});
}
