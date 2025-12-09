import '../models/survey_question.dart';

final concernedOptions = [
  'Yes, I\'m concerned',
  'Very concerned',
  'Sometimes concerned',
  'A little concerned',
  'No, I\'m not concerned',
];

final yesOrNoOptions = ['Yes', 'No'];

final standardSymptomSurveyQuestions = [
  SurveyQuestion(
    questionText:
        '1. Since you last spoke with the virtual nurse, are you concerned about your wound?',
    options: concernedOptions,
  ),

  SurveyQuestion(
    questionText:
        '2. Since you last spoke with the virtual nurse, are you concerned about any pain?',
    options: concernedOptions,
  ),

  SurveyQuestion(
    questionText:
        '3. Since you last spoke with the virtual nurse, are you concerned about your breathing?',
    options: concernedOptions,
  ),

  SurveyQuestion(
    questionText: '4. Are you short of breath?',
    options: yesOrNoOptions,
  ),

  SurveyQuestion(
    questionText:
        '5. Since you last spoke with the virtual nurse, are you concerned about chest pain/chest discomfort?',
    options: concernedOptions,
  ),

  SurveyQuestion(
    questionText:
        '6. Since you last spoke with the virtual nurse, have you fainted?',
    options: yesOrNoOptions,
  ),

  SurveyQuestion(
    questionText:
        '7. Since you last spoke with the virtual nurse, are you concerned about any bleeding?',
    options: concernedOptions,
  ),

  SurveyQuestion(
    questionText:
        '8. Since you last spoke with the virtual nurse, are you concerned about any vomiting, diarrhea or constipation?',
    options: concernedOptions,
  ),

  SurveyQuestion(
    questionText:
        '9. Since you last spoke with the virtual nurse. are you concerned with your ability to urinate?',
    options: concernedOptions,
  ),

  SurveyQuestion(
    questionText:
        '10. Since you last spoke with the virtual nurse, have you had any weakness on one side of your body, loss of vision, or difficulty speaking?',
    options: yesOrNoOptions,
  ),
];
