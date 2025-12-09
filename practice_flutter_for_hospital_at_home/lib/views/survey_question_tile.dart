import 'package:flutter/material.dart';

import '../models/survey_question.dart';

class SurveyQuestionTile extends StatelessWidget {
  final int questionIndex;
  final SurveyQuestion question;
  final int? selectedOption;
  final bool showError;
  final Function(int optionIndex) onSelect;

  const SurveyQuestionTile({
    super.key,
    required this.questionIndex,
    required this.question,
    required this.selectedOption,
    required this.showError,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.questionText,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          if (showError)
            const Text(
              'Please select an answer',
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),

          const SizedBox(height: 12),
          // Options
          ...List.generate(
            question.options.length,
            (optIndex) => _buildOption(optIndex),
          ),
        ],
      ),
    );
  }

  // Helper method to build each option tile
  Widget _buildOption(int optIndex) {
    // Check if this option is selected
    final isSelected = selectedOption == optIndex;

    // Build option tile
    return GestureDetector(
      onTap: () => onSelect(optIndex),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade300 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: showError ? Colors.red : Colors.grey.shade400,
            width: 1.4,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? Colors.black : Colors.grey,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                question.options[optIndex],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
