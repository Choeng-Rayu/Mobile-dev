import 'package:flutter/material.dart';

/// Exercise 1

// import 'ex1/ex1.dart';
// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[600],
//       appBar: AppBar(
//         title: const Text('My Hobbies'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             // Using HobbyCard widget
//             const HobbyCard(
//               hobby: 'Travelling',
//               icon: Icons.travel_explore,
//               cardColor: Colors.green,
//             ),
//             HobbyCard(
//               hobby: 'Skating',
//               icon: Icons.skateboarding,
//               cardColor: Colors.grey[700] as Color,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey[600],
//         appBar: AppBar(
//           title: const Text('My Hobbies'),
//         ),
//       ),
//     ),
//   );
// }



// /// Exercise 2
// import 'ex2/ex2.dart';


// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: const Text('Custom Buttons'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               // Primary button (blue) with icon on left
//               CustomButton(
//                 label: 'Submit',
//                 icon: Icons.check,
//                 buttonType: ButtonType.primary,
//                 iconPosition: IconPosition.right,
//                 onPressed: () {
//                   print('Submit button pressed');
//                   // iconPosition: IconPosition.left,
//                 },
//               ),
//               const SizedBox(height: 15),
              
//               // Secondary button (green) with icon on left
//               CustomButton(
//                 label: 'Time',
//                 icon: Icons.schedule,
//                 buttonType: ButtonType.secondary,
//                 iconPosition: IconPosition.left,
//                 onPressed: () {
//                   print('Time button pressed');
//                 },
//               ),
//               const SizedBox(height: 15),
              
//               // Disabled button (grey)
//               const CustomButton(
//                 label: 'Account',
//                 icon: Icons.account_circle,
//                 buttonType: ButtonType.disabled,
//                 iconPosition: IconPosition.left,
//                 onPressed: null,
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }



















// /// Exercise 3
// import 'ex3/ex3.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blue,
//         appBar: AppBar(
//           title: const Text('Products'),
//         ),
//         body: const Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             children: [
//               // Using ProductCard with Product enum
//               ProductCard(
//                 product: Product.dart,
//               ),
//               SizedBox(height: 16),
//               ProductCard(
//                 product: Product.flutter,
//               ),
//               SizedBox(height: 16),
//               ProductCard(
//                 product: Product.firebase,
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }


/// Exercise 4 - Weather Forecast
import 'ex4/ex4.dart' as ex4;

void main() {
  runApp(const ex4.MyApp());
}

