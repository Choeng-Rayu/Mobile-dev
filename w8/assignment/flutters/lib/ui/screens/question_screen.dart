import 'package:flutter/material.dart';
import 'package:flutters/model/quiz.dart';
import '../theme/theme.dart';
import '../widgets/app_button.dart';
import 'result_screen.dart';

// Stateless widget to display question identifier (number)
class QuestionIdentifier extends StatelessWidget {
  final int questionNumber;
  final int totalQuestions;

  const QuestionIdentifier({
    super.key,
    required this.questionNumber,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: ColorsTheme.layoutColor[0],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$questionNumber',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Stateless widget to display each answer choice
class ResultItem extends StatelessWidget {
  final String choice;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onTap;

  const ResultItem({
    super.key,
    required this.choice,
    required this.isSelected,
    required this.isCorrect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Checkmark or X icon
          if (isSelected)
            Icon(
              isCorrect ? Icons.check_circle : Icons.cancel,
              color: isCorrect ? Colors.green : Colors.red,
              size: 24,
            )
          else
            const SizedBox(width: 24),
          const SizedBox(width: 12),
          
          // Choice button
          Expanded(
            child: AppButton(
              choice,
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionScreen extends StatefulWidget {
  final Quiz quizData;
  final Player player;

  const QuestionScreen({
    super.key,
    required this.quizData,
    required this.player,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool answerSubmitted = false;

  void _selectAnswer(String choice) {
    if (answerSubmitted) return; // Prevent multiple selections

    setState(() {
      selectedAnswer = choice;
      answerSubmitted = true;
    });

    // After a delay, move to next question or finish quiz
    Future.delayed(const Duration(seconds: 1), () {
      final currentQuestion = widget.quizData.questions[currentQuestionIndex];
      
      // Create an Answer and add it to the player
      final answer = Answer(
        questionId: currentQuestion.id,
        answerChoice: choice,
      );
      widget.player.addAnswer(answer);

      if (currentQuestionIndex < widget.quizData.questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          selectedAnswer = null;
          answerSubmitted = false;
        });
      } else {
        // Calculate final score
        final finalScore = widget.player.getLastScorePlayer(widget.quizData.questions);
        
        // Navigate to ResultScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              score: finalScore,
              totalQuestions: widget.quizData.questions.length,
              player: widget.player,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final questions = widget.quizData.questions;
    final currentQuestion = questions[currentQuestionIndex];
    final totalPoints = currentQuestion.points;

    return Scaffold(
      backgroundColor: ColorsTheme.layoutColor[1],
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // this progress indicator is generate by AI 
            // // Progress indicator
            // LinearProgressIndicator(
            //   value: (currentQuestionIndex + 1) / questions.length,
            //   backgroundColor: Colors.grey[300],
            //   valueColor: AlwaysStoppedAnimation<Color>(ColorsTheme.layoutColor[0]!),
            // ),
            // const SizedBox(height: 30),

            // Question content with identifier and title
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Question number in circle
                QuestionIdentifier(
                  questionNumber: currentQuestionIndex + 1,
                  totalQuestions: questions.length,
                ),
                const SizedBox(width: 20),
                
                // Question title and points
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentQuestion.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: ColorsTheme.layoutColor[0],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '$totalPoints points',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Answer choices
            Expanded(
              child: ListView.builder(
                itemCount: currentQuestion.choices.length,
                itemBuilder: (context, index) {
                  final choice = currentQuestion.choices[index];
                  final isSelected = selectedAnswer == choice;
                  final isCorrect = choice == currentQuestion.goodChoice;

                  return ResultItem(
                    choice: choice,
                    isSelected: isSelected,
                    isCorrect: isCorrect,
                    onTap: answerSubmitted ? () {} : () => _selectAnswer(choice),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 