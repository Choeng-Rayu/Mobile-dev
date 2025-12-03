import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../model/quiz.dart';

class QuizRepository {
  final String filePath;

  QuizRepository(this.filePath);

  /// Read a Quiz from an asset JSON file (works on all platforms including web)
  Future<Quiz> readQuizAsync() async {
    final content = await rootBundle.loadString(filePath);
    final data = jsonDecode(content);
    
    var questionJson = data['questions'] as List;
    var questions = questionJson.map((q) {
      return Question(
        title: q['title'],
        choices: List<String>.from(q['choices']),
        goodChoice: q['goodChoice'],
        points: q['points'],
      );
    }).toList();
    
    return Quiz(questions: questions);
  }

  /// Read a Quiz from a JSON file AI generated
  /// The JSON should contain questions and optionally player submissions
  Future<Quiz> readQuizIncludingPlayersAsync() async {
    final content = await rootBundle.loadString(filePath);
    final data = jsonDecode(content) as Map<String, dynamic>;
  
    // Read questions from JSON
    var questionsJson = data['questions'] as List<dynamic>;
    var questions = questionsJson.map((q) {
      return Question(
        id: q['id'] as String?,
        title: q['title'] as String,
        choices: List<String>.from(q['choices'] as List<dynamic>),
        goodChoice: q['goodChoice'] as String,
        points: q['points'] as int,
      );
    }).toList();
  
    // Create the quiz
    Quiz quiz = Quiz(
      id: data['id'] as String?,
      questions: questions,
    );
  
    // Read players and their submissions if they exist
    if (data.containsKey('player')) {
      var playersJson = data['player'] as List<dynamic>;
      for (var p in playersJson) {
        final player = Player(
          id: p['id'] as String?,
          username: p['username'] as String,
        );
  
        // Add answers to the player
        if (p.containsKey('answers')) {
          var answersJson = p['answers'] as List<dynamic>;
          for (var a in answersJson) {
            final answer = Answer(
              id: a['id'] as String?,
              questionId: a['questionId'] as String,
              answerChoice: a['answerChoice'] as String,
            );
            player.addAnswer(answer);
          }
        }
  
        // Calculate the player's score
        player.getLastScorePlayer(questions);
  
        // Add player to quiz
        quiz.addPlayer(player);
      }
    }
  
    return quiz;
  }
}
