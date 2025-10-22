import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  String getUsername() {
    stdout.write('Enter Your Name: ');
    String? username = stdin.readLineSync();
    if (username == null) return '';
    return username;
  }

  Quiz startQuiz() {
    print('--- Welcome to the Quiz ---\n');
    while (true) {
      String username = getUsername();
      if(username.isEmpty) break;
      Player currentPlayer = Player(username: username);
      quiz.addPlayer(currentPlayer);
      for (var question in quiz.questions) {
        print('Question: ${question.title} - (${question.points} points)');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        // Check for null input
        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(questionId: question.id, answerChoice: userInput);
          currentPlayer.addAnswer(answer);
        } else {
          print('No answer entered. Skipping question.');
        }

        print('');
      }
      print('--- Quiz Finished ---');
      int totalScore = currentPlayer.getLastScorePlayer(quiz.questions);
      print('${currentPlayer.username}, Your score: $totalScore points');
      print('Player: ${currentPlayer.username}         Scores: $totalScore');
    }
    print('List all Players');
    quiz.player.isEmpty ? print('No players yet') : {
      for (int i = 0; i < quiz.player.length; i++) {
        print('Player ${i + 1}: ${quiz.player[i].username}, Score: ${quiz.player[i].scores}')
      }
    };
    
    // Return the quiz object with all player data
    return quiz;
  }

}

 