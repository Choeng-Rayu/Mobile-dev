
import 'package:flutter/material.dart'; 
void main() {
  runApp(
    const MaterialApp(
      title: 'My APP',
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello my name is Ronnan!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.orange,
            ),
          ),
        ),
      ),
    ),
  );
}


// for reusable class
// import 'package:flutter/material.dart';

// // ignore: camel_case_types
// class EX1 extends StatelessWidget {
//   const EX1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'My APP',
//       home: Scaffold(
//         body: Center(
//           child: Text(
//             'Hello my name is Ronnan!',
//             style: TextStyle(
//               fontSize: 20,
//               color: Colors.orange,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
