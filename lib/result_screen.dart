import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.pickedAnswers});

  final List<String> pickedAnswers;
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < pickedAnswers.length; i++) {
      summary.add(
        {
          'questions_index': i,
          'questions': questions[i].text,
          'correct_answer': questions[i].answer[0],
          'user_answer': pickedAnswers[i]
        },
        );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You Answeredd X out of Y Questions Correctly!'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummaryData()),           
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
