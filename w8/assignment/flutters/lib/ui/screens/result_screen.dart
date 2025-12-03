import 'package:flutter/material.dart';
import 'package:flutters/model/quiz.dart';
import '../theme/theme.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final Player player;
  final List<Question> questions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.player,
    required this.questions,
  });

  void _restartQuiz(BuildContext context) {
    // Pop all routes until we reach WelcomeScreen (the first route)
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    // Count correct answers
    int correctCount = 0;
    for (var answer in player.answer) {
      final question = Question.findQuestionById(questions, answer.questionId);
      if (question != null && answer.isGood(question)) {
        correctCount++;
      }
    }

    return Scaffold(
      backgroundColor: ColorsTheme.layoutColor[5],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Header: "You answered X on Y !"
              Text(
                'You answered $correctCount on $totalQuestions !',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              
              // Answer list
              Expanded(
                child: ListView.builder(
                  itemCount: player.answer.length,
                  itemBuilder: (context, index) {
                    final answer = player.answer[index];
                    final question = Question.findQuestionById(questions, answer.questionId);
                    
                    if (question == null) return const SizedBox.shrink();
                    
                    final isCorrect = answer.isGood(question);
                    
                    return _buildQuestionResult(
                      questionNumber: index + 1,
                      question: question,
                      userAnswer: answer.answerChoice,
                      isCorrect: isCorrect,
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Restart Quiz button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _restartQuiz(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Restart Quiz',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  /// Build a question result card matching the image design
  Widget _buildQuestionResult({
    required int questionNumber,
    required Question question,
    required String userAnswer,
    required bool isCorrect,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsTheme.layoutColor[5],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question number circle (green if correct, red if wrong)
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isCorrect ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$questionNumber',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Question and choices
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // List all choices with checkmark for correct answer
                ...question.choices.map((choice) {
                  final isGoodChoice = choice == question.goodChoice;
                  final isUserChoice = choice == userAnswer;
                  
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        // Show checkmark for correct answer
                        if (isGoodChoice)
                          const Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 18,
                          )
                        else
                          const SizedBox(width: 18),
                        const SizedBox(width: 8),
                        Text(
                          choice,
                          style: TextStyle(
                            fontSize: 14,
                            color: isGoodChoice
                                ? Colors.green
                                : (isUserChoice && !isGoodChoice)
                                    ? Colors.red
                                    : Colors.black87,
                            fontWeight: isGoodChoice || isUserChoice
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 