import 'package:flutter/material.dart';
import 'package:flutters/model/quiz.dart';
import '../theme/theme.dart';
import '../widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final Player player;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.player,
  });

  void _goHome(BuildContext context) {
    // Pop all routes until we reach WelcomeScreen (the first route)
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    // Calculate percentage based on answers
    final correctAnswers = player.answer.length > 0 
        ? (score > 0 ? 'Great job!' : 'Try again!') 
        : 'No answers';

    return Scaffold(
      backgroundColor: ColorsTheme.layoutColor[5],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Trophy/Result icon
              Icon(
                score > 0 ? Icons.emoji_events : Icons.refresh,
                size: 80,
                color: ColorsTheme.layoutColor[0],
              ),
              const SizedBox(height: 20),
              const Text(
                'Quiz Complete!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                correctAnswers,
                style: TextStyle(
                  fontSize: 18,
                  color: score > 0 ? Colors.green : Colors.orange,
                ),
              ),
              const SizedBox(height: 30),
              
              // Score display
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorsTheme.layoutColor[0],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      'Player: ${player.username}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$score points',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Questions answered: $totalQuestions',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              
              AppButton(
                'Back to Home',
                onTap: () => _goHome(context),
                icon: Icons.home,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 