import 'package:flutter/material.dart';

class SurveyQuestionTile extends StatelessWidget {
  final String question;
  final List<String> options;
  final int? selectedIndex;
  final bool showError;
  final void Function(int) onSelect;

  const SurveyQuestionTile({
    super.key,
    required this.question,
    required this.options,
    required this.selectedIndex,
    required this.showError,
    required this.onSelect,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      key: key, // <-- THE FIX THAT MAKES SCROLL WORK
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        // You can customize the border radius for rounded corners.
        borderRadius: BorderRadius.circular(10.0),
        // The side property defines the border's appearance.
        side: BorderSide(
          color: Colors.grey, // Set the color of the border.
          width: 1.0, // Set the width of the border.
        ),
      ),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            // Divider(color: Colors.grey, thickness: 1.0),
            if (showError)
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  "This question is required",
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            const SizedBox(height: 10),
            // Options
            ...List.generate(
              options.length,
              (optIndex) => _buildOption(optIndex),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(int optIndex) {
    // Check if this option is selected
    final isSelected = selectedIndex == optIndex;

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
                options[optIndex],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
