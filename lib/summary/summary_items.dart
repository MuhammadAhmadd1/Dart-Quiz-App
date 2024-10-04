import 'package:flutter/material.dart';
import 'package:quiz_app/summary/summary_identifiers.dart';

class SummaryItems extends StatelessWidget {
  const SummaryItems(this.itemData, {super.key});
  final Map<String, Object> itemData;
  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SummaryIdentifiers(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int),
        const SizedBox(
          height: 5,
          width: 10,
        ),
         // Expanded widget to allow flexible space usage for question details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the question text
              Text(
                itemData['question'] as String,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),

              // Space between question and answers
              const SizedBox(height: 5),

              // Display the user's answer
              Text(
                itemData['user_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 161, 114, 199),
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Display the correct answer
              Text(
                itemData['correct_answer'] as String,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
