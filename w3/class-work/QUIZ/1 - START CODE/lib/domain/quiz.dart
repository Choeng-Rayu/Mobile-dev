class Question{
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int points;

  Question({required this.title, required this.choices, required this.goodChoice, required this.points});
}

class Answer{
  final Question question;
  final String answerChoice;
  

  Answer({required this.question, required this.answerChoice});

  bool isGood(){
    return this.answerChoice == question.goodChoice;
  }
}

class Player{
  final String username;
  List<Answer> answer = [];
  // int scores = 0;
  Player({required this.username});
  void addAnswer(Answer answer) => this.answer.add(answer);

  int getScores(){
    int totalScores = 0;
    for(int i = 0; i < answer.length; i++){
      if(answer[i].isGood()){
        totalScores += answer[i].question.points;
      }
    }
    return totalScores;
  }
}

class Quiz{
  List<Question> questions;
  // List <Answer> answers =[];
  List<Player> player = [];

  Quiz({required this.questions});


  void addPlayer(Player player){
    this.player.add(player);
  }


}

