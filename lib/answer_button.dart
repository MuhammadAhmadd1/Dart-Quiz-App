import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText, // Text displayed on the button
    required this.onTap,      // Callback function to handle button tap
  });

  final String answerText;            // The answer text to display on the button
  final void Function() onTap;        // Function to be called when the button is tapped

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, // Set the onPressed event to call the provided function
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,   // Vertical padding for the button
          horizontal: 40,  // Horizontal padding for the button
        ),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95), // Button background color
        foregroundColor: Colors.white, // Text color for the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40), // Rounded corners for the button
        ),
      ),
      child: Text(
        answerText, // Display the answer text on the button
        textAlign: TextAlign.center, // Center align the text
      ),
    );
  }
}
