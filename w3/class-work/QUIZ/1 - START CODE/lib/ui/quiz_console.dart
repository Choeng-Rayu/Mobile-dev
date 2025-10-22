import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});
  

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');

    while (true) {
      stdout.write('Enter your name (or leave blank to quit): ');
      String? username = stdin.readLineSync();

      if (username == null || username.isEmpty) {
        break;
      }

      Player currentPlayer = Player(username: username);
      quiz.addPlayer(currentPlayer);

      for (var question in quiz.questions) {
        print('Question: ${question.title} - (${question.points} points)');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(question: question, answerChoice: userInput);
          currentPlayer.addAnswer(answer);
        } else {
          print('No answer entered. Skipping question.');
        }

        print('');
      }

      print('--- Quiz Finished ---');
      print('${currentPlayer.username}, Your score: ${currentPlayer.getScores()} points');
      print('\n--- Player Scores ---');
      for (var p in quiz.player) {
        print('${p.username}: ${p.getScores()} points');
      }
      print('\n');
    }
  }


}
 