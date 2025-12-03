import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/quiz.dart';

class QuizRepository {
  final String filePath;
  static const String _localStorageKey = 'quiz_data';

  QuizRepository(this.filePath);

  /// Check if local data exists
  Future<bool> hasLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_localStorageKey);
  }

  /// Read quiz from local storage (if exists) or from assets
  Future<Quiz> readQuizAsync() async {
    // Try to read from local storage first
    try {
      final prefs = await SharedPreferences.getInstance();
      final localData = prefs.getString(_localStorageKey);
      if (localData != null && localData.isNotEmpty) {
        final data = jsonDecode(localData) as Map<String, dynamic>;
        return Quiz.fromJson(data);
      }
    } catch (e) {
      print('Error reading local storage: $e');
    }

    // Fallback to asset file
    final content = await rootBundle.loadString(filePath);
    final data = jsonDecode(content) as Map<String, dynamic>;
    return Quiz.fromJson(data);
  }

  /// Save quiz data to local storage
  Future<void> saveQuizAsync(Quiz quiz) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonData = jsonEncode(quiz.toJson());
      await prefs.setString(_localStorageKey, jsonData);
      print('Quiz data saved successfully to local storage');
    } catch (e) {
      print('Error saving quiz data: $e');
      rethrow;
    }
  }

  /// Read a Quiz from an asset JSON file (works on all platforms including web)
  Future<Quiz> readQuizFromAssetsAsync() async {
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

  /// Delete local data and reset to asset data
  Future<void> resetToAssetData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_localStorageKey);
      print('Local quiz data deleted');
    } catch (e) {
      print('Error deleting local data: $e');
    }
  }
}
