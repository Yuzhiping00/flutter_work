// This cass defines the structure of a survey response, including the answers provided by the user.

class SurveyResponse {
  final List<int?> answers; // null if not answered yet

  SurveyResponse({required this.answers});

  bool get isComplete => !answers.contains(null);
}
