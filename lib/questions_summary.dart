import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object?>> summaryData; // Use Object? for nullable fields

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map(
        (data) {
          return Row(
            children: [
              Text(((data['question_index'] as int?) ?? 0 + 1).toString()), // Provide a default value for index
              Expanded(
                child: Column(              
                  children: [
                    Text((data['question'] as String?) ?? 'No question'), // Provide default text if null
                    const SizedBox(height: 5),
                    Text((data['user_answer'] as String?) ?? 'No answer'), // Default if null
                    Text((data['correct_answer'] as String?) ?? 'No correct answer'), // Default if null
                  ],
                ),
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
