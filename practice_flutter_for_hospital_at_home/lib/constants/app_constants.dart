import '../models/survey_definition.dart';

final concernedOptions = [
  'Yes, I\'m concerned',
  'Very concerned',
  'Sometimes concerned',
  'A little concerned',
  'No, I\'m not concerned',
];

final yesOrNoOptions = ['Yes', 'No'];

final standardSymptomSurveyQuestions = [
  '1. Since you last spoke with the virtual nurse, are you concerned about your wound?',
  '2. Since you last spoke with the virtual nurse, are you concerned about any pain?',
  '3. Since you last spoke with the virtual nurse, are you concerned about your breathing?',
  '4. Since you last spoke with the virtual nurse, are you concerned about chest pain/chest discomfort?',
  '5. Are you short of breath?',
  '6. Since you last spoke with the virtual nurse, have you fainted?',
  '7. Since you last spoke with the virtual nurse, are you concerned about any bleeding?',
  '8. Since you last spoke with the virtual nurse, are you concerned about any vomiting, diarrhea or constipation?',
  '9. Since you last spoke with the virtual nurse. are you concerned with your ability to urinate?',
  '10. Since you last spoke with the virtual nurse, have you had any weakness on one side of your body, loss of vision, or difficulty speaking?',
];

final standardSymptomSurveyOptions = [
  concernedOptions,
  concernedOptions,
  concernedOptions,
  yesOrNoOptions,
  concernedOptions,
  yesOrNoOptions,
  concernedOptions,
  concernedOptions,
  concernedOptions,
  yesOrNoOptions,
];

final standardSymptomSurvey = SurveyDefinition(
  title: 'Standard Symptom Survey',
  questions: standardSymptomSurveyQuestions,
  options: standardSymptomSurveyOptions,
);
