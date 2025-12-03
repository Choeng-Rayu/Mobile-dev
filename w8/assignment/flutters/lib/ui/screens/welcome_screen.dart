import 'package:flutter/material.dart';
import 'package:flutters/model/quiz.dart';
import '../theme/theme.dart';
import '../widgets/app_button.dart';
import 'question_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final Quiz quizData;

  const WelcomeScreen({
    super.key,
    required this.quizData,
  });

  void _handleStartQuiz(BuildContext context) {
    // Create player without username
    final player = Player(username: 'Player');
    quizData.addPlayer(player);
    
    // PUSH to QuestionScreen using Navigator
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionScreen(
          quizData: quizData,
          player: player,
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
                '${quizData.questions.length} Questions',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              
              AppButton(
                'Start Quiz',
                onTap: () => _handleStartQuiz(context),
                icon: Icons.play_arrow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 
