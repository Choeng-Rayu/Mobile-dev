import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quiz_file_provider.dart';

void main() {

  // List<Question> questions = [
  //   Question(
  //       title: "Capital of France?",
  //       choices: ["Paris", "London", "Rome"],
  //       goodChoice: "Paris",
  //       points: 10),
  //   Question(
  //       title: "2 + 2 = ?",
  //       choices: ["2", "4", "5"],
  //       goodChoice: "4",
  //       points: 50),
  // ];

  try{
    final repository = QuizRepository('lib/data/quiz_repository.json');
    
    // Create console and run the quiz
    QuizConsole console = QuizConsole(quiz: repository.readQuiz());
    // QuizConsole console = QuizConsole(quiz: repository.readQuizIncludingPlayers());
    
    // Start quiz and get the completed quiz with all player data and scores
    Quiz completedQuiz = console.startQuiz();
    
    // Write the completed quiz (with all players and their answers/scores) to file
    repository.writeQuiz(completedQuiz);
    
    // print('\n✓ Quiz data saved successfully to file!');
  }catch(e){
    // print('Error: $e');
    throw 'file not found or empty';
  }
}


