import 'dart:convert';
import 'dart:io';
import '../domain/quiz.dart';

class QuizRepository {
  final String filePath;

  QuizRepository(this.filePath);

  /// Read a Quiz from a JSON file
  /// The JSON should contain questions and optionally player submissions
  // Quiz readQuiz() {
  //   final file = File(filePath);
  //   final content = file.readAsStringSync();
  //   final data = jsonDecode(content) as Map<String, dynamic>;
  //
  //   // Read questions from JSON
  //   var questionsJson = data['questions'] as List<dynamic>;
  //   var questions = questionsJson.map((q) {
  //     return Question(
  //       id: q['id'] as String?,
  //       title: q['title'] as String,
  //       choices: List<String>.from(q['choices'] as List<dynamic>),
  //       goodChoice: q['goodChoice'] as String,
  //       points: q['points'] as int,
  //     );
  //   }).toList();
  //
  //   // Create the quiz
  //   final quiz = Quiz(
  //     id: data['id'] as String?,
  //     questions: questions,
  //   );
  //
  //   // Read players and their submissions if they exist
  //   if (data.containsKey('players')) {
  //     var playersJson = data['players'] as List<dynamic>;
  //     for (var p in playersJson) {
  //       final player = Player(
  //         id: p['id'] as String?,
  //         username: p['username'] as String,
  //       );
  //
  //       // Add answers to the player
  //       if (p.containsKey('answers')) {
  //         var answersJson = p['answers'] as List<dynamic>;
  //         for (var a in answersJson) {
  //           final answer = Answer(
  //             id: a['id'] as String?,
  //             questionId: a['questionId'] as String,
  //             answerChoice: a['answerChoice'] as String,
  //           );
  //           player.addAnswer(answer);
  //         }
  //       }
  //
  //       // Calculate the player's score
  //       player.getLastScorePlayer(questions);
  //
  //       // Add player to quiz
  //       quiz.addPlayer(player);
  //     }
  //   }
  //
  //   return quiz;
  // }

  Quiz readQuiz(){
    final file = File(filePath);
    final content = file.readAsStringSync();
    final data = jsonDecode(content);
    // Map JSON do domain objects
    var questionJson = data['questions'] as List;
    var questions = questionJson.map((q)
    {
      return Question(
          title: q['title'],
          choices: List<String>.from(q['choices']),
          goodChoice: q['goodChoice'],
          points: q['points']
      );
    }).toList();
    return Quiz(questions: questions);
  }
  /// Write a Quiz to a JSON file
  // void writeQuiz(Quiz quiz) {
  //   final data = <String, dynamic>{
  //     'id': quiz.id,
  //     'questions': quiz.questions.map((q) {
  //       return <String, dynamic>{
  //         'id': q.id,
  //         'title': q.title,
  //         'choices': q.choices,
  //         'goodChoice': q.goodChoice,
  //         'points': q.points,
  //       };
  //     }).toList(),
  //     'players': quiz.player.map((p) {
  //       return <String, dynamic>{
  //         'id': p.id,
  //         'username': p.username,
  //         'scores': p.scores,
  //         'answers': p.answer.map((a) {
  //           return <String, dynamic>{
  //             'id': a.id,
  //             'questionId': a.questionId,
  //             'answerChoice': a.answerChoice,
  //           };
  //         }).toList(),
  //       };
  //     }).toList(),
  //   };
  //
  //   final file = File(filePath);
  //   final jsonString = jsonEncode(data);
  //   file.writeAsStringSync(jsonString);
  // }
  void writeQuiz(Quiz quiz){
    final data = <String, dynamic>
    {
      'id' : quiz.id,
      'questions': quiz.questions.map((q)
      {
        return <String, dynamic>
        {
          'id': q.id,
          'title': q.title,
          'choices': q.choices,
          'goodChoice': q.goodChoice,
          'points': q.points
        };
      }).toList(),
      'player' : quiz.player.map((player)
      {
        return <String, dynamic>
        {
          'id' : player.id,
          'username' : player.username,
          'score' : player.scores,
          'answers' : player.answer.map((ans) {
            return <String, dynamic>
            {
              'id' : ans.id,
              'questionId' : ans.id,
              'answerChoince' : ans.answerChoice
            };
          }).toList()
        };
      }).toList()
    };
    final file = File(filePath);
    final JsonToStringWriteInToFile = jsonEncode(data);
    file.writeAsStringSync(JsonToStringWriteInToFile);
  }
}
