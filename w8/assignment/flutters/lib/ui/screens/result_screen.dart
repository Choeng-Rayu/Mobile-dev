import 'package:flutter/material.dart';
import 'package:flutters/model/quiz.dart';
import 'package:flutters/services/quiz_file_provider.dart';
import '../theme/theme.dart';
import '../widgets/app_button.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  final int totalQuestions;
  final Player player;
  final List<Question> questions;
  final Quiz quiz;
  final QuizRepository repository;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.player,
    required this.questions,
    required this.quiz,
    required this.repository,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _isSaving = false;
  bool _saved = false;

  @override
  void initState() {
    super.initState();
    // Auto-save quiz data when result screen loads
    _saveQuizData();
  }

  Future<void> _saveQuizData() async {
    if (_saved) return;
    
    setState(() {
      _isSaving = true;
    });

    try {
      await widget.repository.saveQuizAsync(widget.quiz);
      setState(() {
        _saved = true;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Quiz results saved!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isSaving = false;
      });
    }
  }

  void _restartQuiz(BuildContext context) {
    // Pop all routes until we reach WelcomeScreen (the first route)
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  /// Count correct answers
  int _getCorrectAnswersCount() {
    int count = 0;
    for (var answer in widget.player.answer) {
      final question = Question.findQuestionById(widget.questions, answer.questionId);
      if (question != null && answer.isGood(question)) {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    final correctAnswers = _getCorrectAnswersCount();

    return Scaffold(
      backgroundColor: ColorsTheme.layoutColor[5],
      body: SafeArea(
        child: Column(
          children: [
            // Header - "You answered X on Y !"
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Text(
                    'You answered $correctAnswers on ${widget.totalQuestions} !',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  if (_isSaving)
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Saving...',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            // Scrollable question results
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: widget.player.answer.length,
                itemBuilder: (context, index) {
                  final answer = widget.player.answer[index];
                  final question = Question.findQuestionById(widget.questions, answer.questionId);

                  if (question == null) return const SizedBox.shrink();

                  final isCorrect = answer.isGood(question);

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ColorsTheme.layoutColor[5],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Question number circle
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: isCorrect ? Colors.green : Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Question content
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Question title
                            Text(
                              question.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Display all choices
                            ...question.choices.map((choice) {
                              final isGoodAnswer = choice == question.goodChoice;
                              final isUserAnswer = choice == answer.answerChoice;
                              final isWrongUserAnswer = isUserAnswer && !isGoodAnswer;

                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Show checkmark for correct answer
                                    if (isGoodAnswer)
                                      const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 18,
                                      )
                                    else
                                      const SizedBox(width: 18),
                                    const SizedBox(width: 6),
                                    // Choice text
                                    Text(
                                      choice,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isWrongUserAnswer
                                            ? Colors.green
                                            : Colors.white,
                                        fontWeight: (isGoodAnswer || isWrongUserAnswer)
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Restart Quiz button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AppButton(
                'Restart Quiz',
                onTap: () => _restartQuiz(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 