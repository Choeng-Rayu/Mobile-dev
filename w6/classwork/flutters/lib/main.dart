// import 'package:flutter/material.dart';
// enum MaeAhNang{
//   beforePress(
//     imagePath: "lib/assets/dice-6/dice-2.png"
//   ),
//   afterPress(
//     imagePath: "lib/assets/dice-6/dice-4.png"
//   );

//   final String imagePath;
//   const MaeAhNang({required this.imagePath});
// }

// void main() {

//   onPress(){
//     MaeAhNang.afterPress.imagePath;
//   }
  
//   beforePress(){
//     return Image.asset(MaeAhNang.beforePress.imagePath);
//   }
  
//   runApp(
//     MaterialApp(
//       title: 'My app',
//       home: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextButton(
//             onPressed: onPress,
//             child: beforePress(),
//           )
//         ],
//       ),
//     ),
//   );
// }



import 'dart:math';

import 'package:flutter/material.dart';

const String diceImage2 = 'lib/assets/dice-6/dice-2.png';
const String diceImage4 = 'lib/assets/dice-6/dice-4.png';




class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
   String activeDiceImage = diceImage2;

  // final diceRoll = random.nextInt(6) + 1;
  void rollDice() {
     //  Display the dice 4 !
    final random = Random();
    final diceRoll = random.nextInt(6) + 1;
    setState(() {
       activeDiceImage = 'lib/assets/dice-6/dice-$diceRoll.png';
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          onTap: rollDice,
          activeDiceImage,
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}

void main() => runApp(const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(child: DiceRoller()),
      ),
    ));