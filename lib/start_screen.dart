import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// A StatelessWidget representing the start screen of the quiz
class StartScreen extends StatelessWidget {
  // Constructor to initialize the startQuiz callback
  const StartScreen(this.startQuiz, {super.key});

  // Callback function to start the quiz
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Center the content vertically
        children: [
          // Logo image displayed at the top
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300, // Set the width of the image
            color: const Color.fromARGB(150, 255, 255, 255), // Apply a color filter for opacity
          ),
          // Uncomment the following code to use a different logo style with opacity
          /*
          Opacity(
            opacity: 0.6,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
            ),
          ),
          */
          const SizedBox(height: 80), // Add space between the logo and the text
          
          // Title text for the quiz
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 223, 252), // Text color
              fontSize: 24, // Font size
            ),
          ),
          const SizedBox(height: 30), // Add space between the title and button

          // Outlined button to start the quiz
          OutlinedButton.icon(
            onPressed: startQuiz, // Trigger the startQuiz callback when pressed
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white, // Set button text color
            ),
            icon: const Icon(Icons.arrow_right_alt), // Icon displayed on the button
            label: const Text('Start Quiz'), // Button label
          )
        ],
      ),
    );
  }
}
