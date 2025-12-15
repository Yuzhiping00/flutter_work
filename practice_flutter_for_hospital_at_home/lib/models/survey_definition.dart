// This class defines the structure of a survey, including its title, questions, and possible options for each question.

class SurveyDefinition {
  final String title;
  final List<String> questions;
  final List<List<String>> options;

  SurveyDefinition({
    required this.title,
    required this.questions,
    required this.options,
  });
}
