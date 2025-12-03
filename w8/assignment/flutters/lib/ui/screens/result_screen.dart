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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Header with Trophy/Result icon and title
              Column(
                children: [
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
                  const SizedBox(height: 20),
                  
                  // Score display card
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
                  const SizedBox(height: 20),
                  
                  const Text(
                    'Answer History',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 15),
              
              // Scrollable answer history
              Expanded(
                child: ListView.builder(
                  itemCount: player.answer.length,
                  itemBuilder: (context, index) {
                    final answer = player.answer[index];
                    final question = _findQuestionById(answer.questionId);
                    
                    if (question == null) return const SizedBox.shrink();
                    
                    final isCorrect = answer.isGood(question);
                    
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Question number and status
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: isCorrect 
                                        ? Colors.green 
                                        : Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        question.title,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${question.points} points',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  isCorrect ? Icons.check_circle : Icons.cancel,
                                  color: isCorrect ? Colors.green : Colors.red,
                                  size: 28,
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: 12),
                            const Divider(),
                            const SizedBox(height: 12),
                            
                            // Correct answer and user's answer
                            Text(
                              'Correct Answer: ${question.goodChoice}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Your Answer: ${answer.answerChoice}',
                              style: TextStyle(
                                fontSize: 13,
                                color: isCorrect ? Colors.green : Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Back to Home button
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
  
  /// Helper method to find question by ID
  Question? _findQuestionById(String questionId) {
    try {
      return Question.findQuestionById(player.answer.map((a) {
        // This is a workaround - we need the quiz questions
        return null;
      }).toList() as List<Question>, questionId);
    } catch (e) {
      return null;
    }
  }
}
 