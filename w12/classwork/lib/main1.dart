import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Text Input Demo',
      home: TextInputDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TextInputDemo extends StatefulWidget {
  const TextInputDemo({super.key});

  @override
  State<TextInputDemo> createState() => _TextInputDemoState();
}

class _TextInputDemoState extends State<TextInputDemo> {
  // =====================
  // CASE 1
  // =====================
  String liveText = '';
  String case1Error = '';

  // =====================
  // CASE 2
  // =====================
  final TextEditingController loginController = TextEditingController();

  // =====================
  // CASE 3
  // =====================
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Text Input – 3 Cases')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // =====================
            // CASE 1 UI
            // =====================
            const Text(
              'CASE 1: TextField with setState',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Live Text',
              ),
              onChanged: (value) {
                setState(() {
                  liveText = value;
                  if (RegExp(r'\d').hasMatch(value)) {
                    case1Error = 'Please input characters only, not numbers!';
                  } else {
                    case1Error = '';
                  }
                });
              },
            ),
            const SizedBox(height: 8),
            Text('Typed: $liveText'),
            if (case1Error.isNotEmpty)
              Text(
                case1Error,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),

            const Divider(height: 40),

            // =====================
            // CASE 2 UI
            // =====================
            const Text(
              'CASE 2: TextField with Controller',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: loginController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                final text = loginController.text;
                if (RegExp(r'\d').hasMatch(text)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please input characters only, not numbers!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Username: ${loginController.text}'),
                    ),
                  );
                  loginController.clear();
                }
              },
              child: const Text('Submit'),
            ),

            const Divider(height: 40),

            // =====================
            // CASE 3 UI
            // =====================
            const Text(
              'CASE 3: Form + Validation',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      if (RegExp(r'\d').hasMatch(value)) {
                        return 'Please input characters only, not numbers!';
                      }
                      if (value.length < 3) {
                        return 'Name must be at least 3 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Valid Name: ${nameController.text}'),
                          ),
                        );
                      }
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
