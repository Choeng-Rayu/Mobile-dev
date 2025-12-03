import 'package:flutter/material.dart';
import 'package:flutters/model/quiz.dart';
import 'package:flutters/services/quiz_file_provider.dart';
import '../theme/theme.dart';
import '../widgets/app_button.dart';
import 'question_screen.dart';

class WelcomeScreen extends StatefulWidget {
  final Quiz quizData;
  final QuizRepository repository;

  const WelcomeScreen({
    super.key,
    required this.quizData,
    required this.repository,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _handleStartQuiz() {
    final username = _usernameController.text.trim();
    if (username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your username')),
      );
      return;
    }
    
    // Create player and add to quiz
    final player = Player(username: username);
    widget.quizData.addPlayer(player);
    
    // PUSH to QuestionScreen using Navigator
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionScreen(
          quizData: widget.quizData,
          player: player,
          repository: widget.repository,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.layoutColor[6],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/quiz-logo.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              const SizedBox(height: 30),
              
              // Quiz info
              Text(
                '${widget.quizData.questions.length} Questions',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              
              // Username input
              SizedBox(
                width: 280,
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your username',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              
              AppButton(
                'Start Quiz',
                onTap: _handleStartQuiz,
                icon: Icons.play_arrow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 
