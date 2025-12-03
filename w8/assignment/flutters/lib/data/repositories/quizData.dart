import 'package:flutters/model/quiz.dart';

/// Sample joke quiz data for testing
class QuizData {
  static Quiz getJokeQuiz() {
    return Quiz(
      questions: [
        Question(
          title: 'Who is the best teacher?',
          choices: ['Him', 'Ronan', 'Sokan'],
          goodChoice: 'Ronan',
          points: 10,
        ),
        Question(
          title: 'What is the best color',
          choices: ['Blue', 'Red', 'Green'],
          goodChoice: 'Blue',
          points: 10,
        ),
      ],
    );
  }
}
