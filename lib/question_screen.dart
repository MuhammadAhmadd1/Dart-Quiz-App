import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

// A StatefulWidget representing the question screen of the quiz
class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer, // Callback function to handle answer selection
  });

  final void Function(String answer) onSelectAnswer; // Callback for answer selection

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  // Variable to track the current question index
  var currentQuestionIndex = 0;

  // Method to handle the answer selection
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer); // Call the callback with the selected answer
    setState(() {
      currentQuestionIndex++; // Increment the question index
    });
  }

  @override
  Widget build(context) {
    // Get the current question based on the index
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, // Make the width take the full width of the parent
      child: Container(
        margin: const EdgeInsets.all(40), // Add margin around the container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch content horizontally
          children: [
            // Display the current question text
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251), // Text color
                fontSize: 24, // Font size
                fontWeight: FontWeight.bold, // Bold font weight
              ),
              textAlign: TextAlign.center, // Center the text
            ),
            const SizedBox(height: 30), // Add space between the question and answers

            // Map over the shuffled answers and create an AnswerButton for each
            // ... converts the answers into comma seperated values instead of widgets
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer, // Pass the answer text to the button
                onTap: () {
                  answerQuestion(answer); // Call answerQuestion when the button is tapped
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
