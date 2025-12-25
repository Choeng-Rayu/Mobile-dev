import 'package:flutter/material.dart';
import 'ui/groceries/grocery_list.dart';





void main() {

  runApp(const MyApp());
  // runApp(Case1Example());
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Groceries',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 147, 229, 250),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 42, 51, 59),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
      ),
      home: const GroceryList(),
    );
  }
}






// class Case3Example extends StatefulWidget {
//   @override
//   State<Case3Example> createState() => _Case3ExampleState();
// }

// class _Case3ExampleState extends State<Case3Example> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     super.dispose();
//   }

//   void submitForm() {
//     if (_formKey.currentState!.validate()) {
//       print('Name: ${_nameController.text}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             controller: _nameController,
//             decoration: const InputDecoration(labelText: 'Name'),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Name is required';
//               }
//               if (value.length < 3) {
//                 return 'Name must be at least 3 characters';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: submitForm,
//             child: const Text('Register'),
//           ),
//         ],
//       ),
//     );
//   }
// }





// class Case1Example extends StatefulWidget {
//   @override
//   State<Case1Example> createState() => _Case1ExampleState();
// }

// class _Case1ExampleState extends State<Case1Example> {
//   String text = '';

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           decoration: const InputDecoration(labelText: 'Search'),
//           onChanged: (value) {
//             setState(() {
//               text = value;
//             });
//           },
//         ),
//         const SizedBox(height: 10),
//         Text('You typed: $text'),
//       ],
//     );
//   }
// }



// class Case2Example extends StatefulWidget {
//   @override
//   State<Case2Example> createState() => _Case2ExampleState();
// }

// class _Case2ExampleState extends State<Case2Example> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   void dispose() {
//     _controller.dispose(); // important!
//     super.dispose();
//   }

//   void submit() {
//     print('Username: ${_controller.text}');
//     _controller.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           controller: _controller,
//           decoration: const InputDecoration(labelText: 'Username'),
//         ),
//         const SizedBox(height: 10),
//         ElevatedButton(
//           onPressed: submit,
//           child: const Text('Submit'),
//         ),
//       ],
//     );
//   }
// }
