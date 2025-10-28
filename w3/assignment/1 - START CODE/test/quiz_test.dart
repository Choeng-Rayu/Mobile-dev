import 'dart:io';

import 'package:test/test.dart';
import 'package:assignment/domain/quiz.dart';
import 'package:assignment/data/quiz_file_provider.dart';

main() {

  List<Question> questions = [
    Question(
        id: "q-001",
        title: "Capital of France?",
        choices: ["Paris", "London", "Rome"],
        goodChoice: "Paris",
        points: 10),
    Question(
        id: "q-002",
        title: "2 + 2 = ?",
        choices: ["2", "4", "5"],
        goodChoice: "4",
        points: 50),
  ];
  const ans = ["Paris", "4"];

  // Create a quiz test with 2 questions and the answers to the 2 questions
  test('test Quizs', (){
    for(int i = 0 ; i < questions.length; i++){
      expect(questions[i].goodChoice,  equals(ans[i]));
    }
  });

  // Check the score is the expected score (as example: 100, 50 or 0)
  test('Expect Scores', (){
    int totalScores = 0;
    for(int i = 0; i < questions.length; i++ ){
      if(questions[i].goodChoice == ans[i]){
        totalScores += questions[i].points;
      }
    }
    expect(totalScores, equals(60));
  });

  test('check the submissions score', (){
    Quiz quiz = Quiz(questions: questions);
    Player player = Player(username: "rayu");
    
    // Add correct answers
    player.addAnswer(Answer(questionId: "q-001", answerChoice: "Paris"));
    player.addAnswer(Answer(questionId: "q-002", answerChoice: "4"));
    
    quiz.addPlayer(player);
    
    final score = player.getLastScorePlayer(questions);
    expect(score, equals(60));
  });

  test('check the submissions with mixed answers', (){
    Quiz quiz = Quiz(questions: questions);
    Player player = Player(username: "alice");
    
    // Add mixed answers (one correct, one wrong)
    player.addAnswer(Answer(questionId: questions[0].id, answerChoice: "Paris"));
    player.addAnswer(Answer(questionId: questions[1].id, answerChoice: "2"));
    
    quiz.addPlayer(player);
    
    final score = player.getLastScorePlayer(questions);
    expect(score, equals(10)); // Only first question is correct
  });

  test('getQuestionById returns correct question', (){
    Quiz quiz = Quiz(questions: questions);
    
    final question = Question.findQuestionById(questions, questions[0].id);
    expect(question, isNotNull);
    expect(question!.title, equals("Capital of France?"));
  });

  test('getPlayerById returns correct player', (){
    Quiz quiz = Quiz(questions: questions);
    Player player = Player(username: "rayu");
    quiz.addPlayer(player);
    
    final foundPlayer = Player.findPlayerById(quiz.player, player.id);
    expect(foundPlayer, isNotNull);
    expect(foundPlayer!.username, equals("rayu"));
  });

  test('getAnswerById returns correct answer', (){
    Quiz quiz = Quiz(questions: questions);
    Player player = Player(username: "rayu");
    
    final answer = Answer(questionId: questions[0].id, answerChoice: "Paris");
    player.addAnswer(answer);
    quiz.addPlayer(player);
    
    final foundAnswer = Answer.findQuestionByid(player.answer, answer.id);
    expect(foundAnswer, isNotNull);
    expect(foundAnswer!.answerChoice, equals("Paris"));
  });

  // test('Read quiz from JSON file', (){
  //   final repository = QuizRepository('test/quiz_data.json');
  //   final quiz = repository.readQuiz();
  //
  //   expect(quiz.id, equals("quiz-001"));
  //   expect(quiz.questions.length, equals(3));
  //   expect(quiz.player.length, equals(2));
  //
  //   // Check first question
  //   expect(quiz.questions[0].id, equals("q-001"));
  //   expect(quiz.questions[0].title, equals("Capital of France?"));
  //
  //   // Check first player
  //   expect(quiz.player[0].username, equals("rayu"));
  //   expect(quiz.player[0].answer.length, equals(3));
  //   expect(quiz.player[0].answer[0].answerChoice, equals("Paris"));
  // });

  // test('Write quiz to JSON file and read it back', (){
  //   final testFilePath = 'test/quiz_output_test.json';
  //
  //   // Create a quiz
  //   final quiz = Quiz(questions: questions);
  //   final player = Player(username: "testuser");
  //   player.addAnswer(Answer(questionId: "q-001", answerChoice: "Paris"));
  //   player.addAnswer(Answer(questionId: "q-002", answerChoice: "4"));
  //   quiz.addPlayer(player);
  //
  //   // Write to JSON
  //   final repository = QuizRepository(testFilePath);
  //   repository.writeQuiz(quiz);
  //
  //   // Verify file was created
  //   expect(File(testFilePath).existsSync(), isTrue);
  //
  //   // Read it back
  //   final readQuiz = repository.readQuiz();
  //   expect(readQuiz.id, equals(quiz.id));
  //   expect(readQuiz.questions.length, equals(2));
  //   expect(readQuiz.player.length, equals(1));
  //   expect(readQuiz.player[0].username, equals("testuser"));
  //
  //   // Clean up
  //   File(testFilePath).deleteSync();
  // });
}

