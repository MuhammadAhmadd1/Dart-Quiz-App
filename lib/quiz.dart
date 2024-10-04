import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/question_screen.dart';

class Quiz extends StatefulWidget { // The main Quiz widget that manages the quiz state
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = []; // List to keep track of the selected answers

  var activeScreen = 'start-screen';  // Variable to determine which screen to show

  void switchScreen() { // Method to switch to the questions screen
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) { // Method to handle answer selection

    selectedAnswers.add(answer);  // Add the chosen answer to the list

    if (selectedAnswers.length == questions.length) {   // Check if all questions have been answered
      setState(() {
        activeScreen = 'results-screen'; // Switch to results screen
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);  // Initialize the starting screen widget

    if (activeScreen == 'questions-screen') { // Determine which screen to display based on the active screen
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,  // Pass the answer selection callback
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers, // Pass the selected answers to results screen
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,  // Display the current screen widget
        ),
      ),
    );
  }
}