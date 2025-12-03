import 'package:flutter/material.dart';
import 'package:flutters/model/quiz.dart';
import 'package:flutters/services/quiz_file_provider.dart';
import './screens/welcome_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Quiz? quizData;
  bool isLoading = true;
  late QuizRepository repository;

  @override
  void initState() {
    super.initState();
    _loadQuizData();
  }

  Future<void> _loadQuizData() async {
    // 1 - Load quiz data from JSON file (async)
    // First tries local storage, then falls back to assets
    const String filePath = 'lib/data/repositories/quiz_repository.json';
    repository = QuizRepository(filePath);
    final loadedQuiz = await repository.readQuizAsync();
    
    setState(() {
      quizData = loadedQuiz;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show loading while quiz data is being fetched
    if (isLoading) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // WelcomeScreen is always home - navigation happens via Navigator.push
      home: WelcomeScreen(quizData: quizData!, repository: repository),
    );
  }
}
