import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

    class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 50),
          Text(
            'Learn Flutter in a Fun Way!',
            style: GoogleFonts.lato(color: Colors.white, fontSize: 22),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: Text('Start Quiz',style: GoogleFonts.lato(),),
            icon: const Icon(Icons.arrow_right_sharp),
          )
        ],
      ),
    );
  }
}   
