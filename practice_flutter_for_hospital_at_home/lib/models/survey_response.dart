class SurveyResponse {
  final List<int?> answers; // null if not answered yet

  SurveyResponse({required this.answers});

  bool get isComplete => !answers.contains(null);
}
