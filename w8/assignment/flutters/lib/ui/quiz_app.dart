import 'package:flutter/material.dart';
import 'package:flutters/data/repositories/quizData.dart';
import './screens/welcome_screen.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get quiz data from QuizData class
    final quizData = QuizData.getJokeQuiz();

    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: WelcomeScreen(quizData: quizData),
    );
  }
}
