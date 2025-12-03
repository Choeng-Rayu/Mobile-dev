import 'package:flutter/material.dart';
import 'package:flutters/model/quiz.dart';
import '../theme/theme.dart';
import '../widgets/app_button.dart';
import 'result_screen.dart';

class QuestionScreen extends StatefulWidget {
  final Quiz quizData;
  final Player player;

  const QuestionScreen({
    super.key,
    required this.quizData,
    required this.player,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void _selectAnswer(String choice) {
    final currentQuestion = widget.quizData.questions[currentQuestionIndex];
    
    // Create an Answer and add it to the player
    final answer = Answer(
      questionId: currentQuestion.id,
      answerChoice: choice,
    );
    widget.player.addAnswer(answer);

    // Move to next question or finish quiz
    if (currentQuestionIndex < widget.quizData.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Calculate final score
      final finalScore = widget.player.getLastScorePlayer(widget.quizData.questions);
      
      // Navigate to ResultScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: finalScore,
            totalQuestions: widget.quizData.questions.length,
            player: widget.player,
            questions: widget.quizData.questions,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final questions = widget.quizData.questions;
    final currentQuestion = questions[currentQuestionIndex];
    final totalPoints = currentQuestion.points;

    return Scaffold(
      backgroundColor: ColorsTheme.layoutColor[6],
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// this progress indicator is generate by AI but not used
            // Progress indicator
            // LinearProgressIndicator(
            //   value: (currentQuestionIndex + 1) / questions.length,
            //   backgroundColor: Colors.grey[300],
            //   valueColor: AlwaysStoppedAnimation<Color>(ColorsTheme.layoutColor[0]!),
            // ),
            // const SizedBox(height: 30),
            // Points badge
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                QuestionIdentifier(questionNumber: currentQuestionIndex + 1),
                const SizedBox(width: 20),
                // Question title
                Title(currentQuestion: currentQuestion),
                const SizedBox(width: 10),
                DisplayPoint(totalPoints: totalPoints),
                // const SizedBox(width: 30),
              ],
            ),
            const SizedBox(height: 40),
            
            // Answer choices using AppButton
            Expanded(
              child: ListView.separated(
                itemCount: currentQuestion.choices.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final choice = currentQuestion.choices[index];
                  return AppButton(
                    choice,
                    onTap: () => _selectAnswer(choice),
                  );
                },
              ),
             ),
            
          ],
        ),
      ),
    );
  }
}

class DisplayPoint extends StatelessWidget {
  const DisplayPoint({
    super.key,
    required this.totalPoints,
  });

  final int totalPoints;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: ColorsTheme.layoutColor[0],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '$totalPoints points',
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
    required this.currentQuestion,
  });

  final Question currentQuestion;

  @override
  Widget build(BuildContext context) {
    return Text(
      currentQuestion.title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
 

// Stateless widget to display question identifier (number)
class QuestionIdentifier extends StatelessWidget {
  final int questionNumber;

  const QuestionIdentifier({
    super.key,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: ColorsTheme.layoutColor[0],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$questionNumber',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}



// // Stateless widget to display each answer choice
// class ResultItem extends StatelessWidget {
//   final String choice;
//   final bool isSelected;
//   final bool isCorrect;
//   final VoidCallback onTap;

//   const ResultItem({
//     super.key,
//     required this.choice,
//     required this.isSelected,
//     required this.isCorrect,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           // Checkmark or X icon
//           if (isSelected)
//             Icon(
//               isCorrect ? Icons.check_circle : Icons.cancel,
//               color: isCorrect ? Colors.green : Colors.red,
//               size: 24,
//             )
//           else
//             const SizedBox(width: 24),
//           const SizedBox(width: 12),
          
//           // Choice button
//           child: AppButton(
//               choice,
//               onTap: onTap,
//             ),
//         ],
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:flutters/model/quiz.dart';
// import '../theme/theme.dart';
// import '../widgets/app_button.dart';
// import 'result_screen.dart';

// class QuestionScreen extends StatefulWidget {
//   final Quiz quizData;
//   final Player player;

//   const QuestionScreen({
//     super.key,
//     required this.quizData,
//     required this.player,
//   });

//   @override
//   State<QuestionScreen> createState() => _QuestionScreenState();
// }

// class _QuestionScreenState extends State<QuestionScreen> {
//   int currentQuestionIndex = 0;

//   void _selectAnswer(String choice) {
//     final currentQuestion = widget.quizData.questions[currentQuestionIndex];
    
//     // Create an Answer and add it to the player
//     final answer = Answer(
//       questionId: currentQuestion.id,
//       answerChoice: choice,
//     );
//     widget.player.addAnswer(answer);

//     // Move to next question or finish quiz
//     if (currentQuestionIndex < widget.quizData.questions.length - 1) {
//       setState(() {
//         currentQuestionIndex++;
//       });
//     } else {
//       // Calculate final score
//       final finalScore = widget.player.getLastScorePlayer(widget.quizData.questions);
      
//       // Navigate to ResultScreen
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ResultScreen(
//             score: finalScore,
//             totalQuestions: widget.quizData.questions.length,
//             player: widget.player,
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final questions = widget.quizData.questions;
//     final currentQuestion = questions[currentQuestionIndex];
//     final totalPoints = currentQuestion.points;

//     return Scaffold(
//       backgroundColor: ColorsTheme.layoutColor[6],
//       body: Padding(
//         padding: const EdgeInsets.all(40.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             /// this progress indicator is generate by AI but not used
//             // Progress indicator
//             // LinearProgressIndicator(
//             //   value: (currentQuestionIndex + 1) / questions.length,
//             //   backgroundColor: Colors.grey[300],
//             //   valueColor: AlwaysStoppedAnimation<Color>(ColorsTheme.layoutColor[0]!),
//             // ),
//             // const SizedBox(height: 30),
//             // Points badge
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
                  
//                   QuestionIdentifier(questionNumber: currentQuestionIndex + 1),
//                   const SizedBox(width: 20),
//                   // Question title
//                   Expanded(
//                     child: Title(currentQuestion: currentQuestion),
//                   ),
//                   const SizedBox(width: 10),
//                   DisplayPoint(totalPoints: totalPoints),
//                   // const SizedBox(width: 30),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 40),
            
//             // Answer choices using AppButton
//             Expanded(
//               child: ListView.separated(
//                 itemCount: currentQuestion.choices.length,
//                 separatorBuilder: (context, index) => const SizedBox(height: 16),
//                 itemBuilder: (context, index) {
//                   final choice = currentQuestion.choices[index];
//                   return AppButton(
//                     choice,
//                     onTap: () => _selectAnswer(choice),
//                   );
//                 },
//               ),
//              ),
            
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DisplayPoint extends StatelessWidget {
//   const DisplayPoint({
//     super.key,
//     required this.totalPoints,
//   });

//   final int totalPoints;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         color: ColorsTheme.layoutColor[0],
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         '$totalPoints points',
//         style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }

// class Title extends StatelessWidget {
//   const Title({
//     super.key,
//     required this.currentQuestion,
//   });

//   final Question currentQuestion;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       currentQuestion.title,
//       style: const TextStyle(
//         fontSize: 22,
//         fontWeight: FontWeight.bold,
//       ),
//       textAlign: TextAlign.center,
//       overflow: TextOverflow.ellipsis,
//       maxLines: 2,
//     );
//   }
// }
 

// // Stateless widget to display question identifier (number)
// class QuestionIdentifier extends StatelessWidget {
//   final int questionNumber;

//   const QuestionIdentifier({
//     super.key,
//     required this.questionNumber,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 60,
//       height: 60,
//       decoration: BoxDecoration(
//         color: ColorsTheme.layoutColor[0],
//         shape: BoxShape.circle,
//       ),
//       child: Center(
//         child: Text(
//           '$questionNumber',
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }



// // // Stateless widget to display each answer choice
// // class ResultItem extends StatelessWidget {
// //   final String choice;
// //   final bool isSelected;
// //   final bool isCorrect;
// //   final VoidCallback onTap;

// //   const ResultItem({
// //     super.key,
// //     required this.choice,
// //     required this.isSelected,
// //     required this.isCorrect,
// //     required this.onTap,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8.0),
// //       child: Row(
// //         children: [
// //           // Checkmark or X icon
// //           if (isSelected)
// //             Icon(
// //               isCorrect ? Icons.check_circle : Icons.cancel,
// //               color: isCorrect ? Colors.green : Colors.red,
// //               size: 24,
// //             )
// //           else
// //             const SizedBox(width: 24),
// //           const SizedBox(width: 12),
          
// //           // Choice button
// //           child: AppButton(
// //               choice,
// //               onTap: onTap,
// //             ),
// //         ],
// //       ),
// //     );
// //   }
// // }

