import 'package:uuid/uuid.dart';

class GenerateId{
  var _generateId = Uuid();
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
  Question({String? id, required this.title, required this.choices, required this.goodChoice, required this.points}) : this.id = id ?? GenerateId().genterIdV4();
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
  Answer({String? id, required this.questionId, required this.answerChoice}) : this.id = id ?? GenerateId().genterIdV4();
  static Answer? findQuestionByid(List<Answer> answers, String id){
    try{
      return answers.firstWhere((findAnswer) => findAnswer.id == id);
    }catch(e){
      return null;
    }
  }
  bool isGood(Question question){
    return this.answerChoice == question.goodChoice;
  }

}

class Player extends GenerateId{
  final String username;
  List<Answer> answer = [];
  final String id;
  Player({String? id, required this.username}) : this.id = id ?? GenerateId().genterIdV4();
  int scores = 0;

  void addAnswer(Answer answer) => this.answer.add(answer);
  static Player? findPlayerById(List<Player> players, String id){
    try{
      return players.firstWhere((findPlayer) => findPlayer.id == id);
    }catch(e){
      return null;
    }
  }
  int getLastScorePlayer(List<Question> questions){
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

  Quiz({String? id, required this.questions}) : this.id = id ?? GenerateId().genterIdV4();

  void addPlayer(Player newPlayer){
    bool samePlayer = true;
   for(int i = 0; i < player.length; i++){
     if(player[i].username == newPlayer.username){
       this.player[i] = newPlayer;
       samePlayer = false;
       break;
     }
   }
   if(samePlayer) this.player.add(newPlayer);
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

