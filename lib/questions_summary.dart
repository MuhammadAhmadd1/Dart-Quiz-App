import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  // Constructor that takes a list of summary data
  const QuestionsSummary(this.summaryData, {super.key});

  // List containing summary data for questions
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map(
        (data) {
          return Row(
            children: [
              // Display question index (1-based)
              Text(((data['question_index'] as int) + 1).toString()), 
              
              // Expanded widget to allow flexible space usage for question details
              Expanded(
                child: Column(
                  children: [
                    // Display the question text
                    Text(data['question'] as String),
                    
                    // Space between question and answers
                    const SizedBox(height: 5),
                    
                    // Display the user's answer
                    Text(data['user_answer'] as String),
                    
                    // Display the correct answer
                    Text(data['correct_answer'] as String),
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
