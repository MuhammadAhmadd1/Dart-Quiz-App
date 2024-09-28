import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
  });

  // List of answers chosen by the user
  final List<String> chosenAnswers;

  // Method to generate summary data for the results
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    // Iterate over the chosen answers to create summary entries
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i, // Index of the question
          'question': questions[i].text, // Text of the question
          'correct_answer': questions[i].answers[0], // Correct answer
          'user_answer': chosenAnswers[i] // User's selected answer
        },
      );
    }

    return summary; // Return the summary list
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Full width of the parent
      child: Container(
        margin: const EdgeInsets.all(40), // Margin around the container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          children: [
            // Display message with the score
            const Text('You answered X out of Y questions correctly!'),
            const SizedBox(height: 30), // Space between elements
            // Summary of questions and answers
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 30), // Space between elements
            // Button to restart the quiz
            TextButton(
              onPressed: () {
                // Define restart quiz action here
              },
              child: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
