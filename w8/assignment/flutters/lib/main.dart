import 'package:flutter/material.dart';
import 'ui/quiz_app.dart';

void main() {
  // Initialize Flutter bindings FIRST
  WidgetsFlutterBinding.ensureInitialized();

  // Quiz data will be loaded asynchronously in QuizApp
  runApp(const QuizApp());
}
