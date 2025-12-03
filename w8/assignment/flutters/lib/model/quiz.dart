import 'package:uuid/uuid.dart';

class GenerateId{
  final _generateId = const Uuid();
  GenerateId();
  String genterIdV4(){
    return _generateId.v4();
  }
}

class Question extends GenerateId{
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int points;
  Question({String? id, required this.title, required this.choices, required this.goodChoice, required this.points}) : id = id ?? GenerateId().genterIdV4();
  
  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'choices': choices,
      'goodChoice': goodChoice,
      'points': points,
    };
  }
  
  // Create from JSON
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as String?,
      title: json['title'] as String,
      choices: List<String>.from(json['choices'] as List<dynamic>),
      goodChoice: json['goodChoice'] as String,
      points: json['points'] as int,
    );
  }
  
  static Question? findQuestionById(List<Question> questions, String id){
    try{
      return questions.firstWhere((finQuestion) => finQuestion.id == id);
    }catch(e){
      return null;
    }
  }
 
}

class Answer extends GenerateId{
  final String questionId;
  final String answerChoice;
  final String id;
  Answer({String? id, required this.questionId, required this.answerChoice}) : id = id ?? GenerateId().genterIdV4();
  
  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionId': questionId,
      'answerChoice': answerChoice,
    };
  }
  
  // Create from JSON
  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'] as String?,
      questionId: json['questionId'] as String,
      answerChoice: json['answerChoice'] as String,
    );
  }
  
  static Answer? findQuestionByid(List<Answer> answers, String id){
    try{
      return answers.firstWhere((findAnswer) => findAnswer.id == id);
    }catch(e){
      return null;
    }
  }
  bool isGood(Question question){
    return answerChoice == question.goodChoice;
  }

}

class Player extends GenerateId{
  final String username;
  List<Answer> answer = [];
  final String id;
  Player({String? id, required this.username}) : id = id ?? GenerateId().genterIdV4();
  int scores = 0;

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'score': scores,
      'answers': answer.map((a) => a.toJson()).toList(),
    };
  }
  
  // Create from JSON
  factory Player.fromJson(Map<String, dynamic> json) {
    final player = Player(
      id: json['id'] as String?,
      username: json['username'] as String,
    );
    player.scores = json['score'] as int? ?? 0;
    
    if (json.containsKey('answers') && json['answers'] != null) {
      final answersJson = json['answers'] as List<dynamic>;
      for (var a in answersJson) {
        player.addAnswer(Answer.fromJson(a as Map<String, dynamic>));
      }
    }
    return player;
  }

  void addAnswer(Answer answer) => this.answer.add(answer);
  static Player? findPlayerById(List<Player> players, String id){
    try{
      return players.firstWhere((findPlayer) => findPlayer.id == id);
    }catch(e){
      return null;
    }
  }
  int getLastScorePlayer(List<Question> questions){
    scores = 0; // Reset score before calculating
    for(Answer ans in answer){
      // Find the question by questionId using the static method
      Question? foundQuestion = Question.findQuestionById(questions, ans.questionId);
      
      if(foundQuestion != null && ans.isGood(foundQuestion)) {
        scores += foundQuestion.points;
      }
    }
    return scores;
  }
}

class Quiz extends GenerateId {
  List<Question> questions;
  List<Player> player = [];
  final String id;

  Quiz({String? id, required this.questions}) : id = id ?? GenerateId().genterIdV4();

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questions': questions.map((q) => q.toJson()).toList(),
      'player': player.map((p) => p.toJson()).toList(),
    };
  }
  
  // Create from JSON
  factory Quiz.fromJson(Map<String, dynamic> json) {
    final questionsJson = json['questions'] as List<dynamic>;
    final questions = questionsJson.map((q) => Question.fromJson(q as Map<String, dynamic>)).toList();
    
    final quiz = Quiz(
      id: json['id'] as String?,
      questions: questions,
    );
    
    if (json.containsKey('player') && json['player'] != null) {
      final playersJson = json['player'] as List<dynamic>;
      for (var p in playersJson) {
        final player = Player.fromJson(p as Map<String, dynamic>);
        player.getLastScorePlayer(questions); // Calculate score
        quiz.player.add(player);
      }
    }
    
    return quiz;
  }

  void addPlayer(Player newPlayer){
    bool samePlayer = true;
   for(int i = 0; i < player.length; i++){
     if(player[i].username == newPlayer.username){
       player[i] = newPlayer;
       samePlayer = false;
       break;
     }
   }
   if(samePlayer) player.add(newPlayer);
  }


  // /// Helper method to find an answer from a player by its ID
  // Answer? getAnswerById(List<Player> players, String playerId,  String answerId) {
  //   Player? foundPlayer = Player.findPlayerById(players, playerId);
  //   if (foundPlayer == null) return null;
  //
  //   try {
  //     return foundPlayer.answer.firstWhere((a) => a.id == answerId);
  //   } catch (e) {
  //     return null;
  //   }
  // }


}
