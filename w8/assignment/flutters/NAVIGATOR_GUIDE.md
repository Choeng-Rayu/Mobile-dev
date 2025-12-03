# Navigator Push & Pop with State Management - Flutter Guide

## Overview
Navigation in Flutter allows you to move between screens. **Push** adds a new screen on top, **Pop** removes the current screen.

---

## 1. Basic Navigator Push & Pop

### Push (Navigate to a new screen)
```dart
// Navigate FROM welcome screen TO question screen
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const QuestionScreen()),
);r
```

### Pop (Go back to previous screen)
```dart
// Navigate back from question screen to welcome screen
Navigator.pop(context);
```

---

## 2. Passing Data Between Screens (Using Push)

### Screen A → Screen B (Pass Data Forward)

**Welcome Screen (Parent) → Question Screen (Child)**

```dart
// In WelcomeScreen - PUSH with data
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => QuestionScreen(
      quizName: 'Flutter Basics',
      totalQuestions: 10,
    ),
  ),
);
```

**Update QuestionScreen to receive data:**
```dart
class QuestionScreen extends StatelessWidget {
  final String quizName;
  final int totalQuestions;

  const QuestionScreen({
    super.key,
    required this.quizName,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(quizName)),
      body: Center(
        child: Text('Questions: $totalQuestions'),
      ),
    );
  }
}
```

---

## 3. Returning Data from Pop

### Screen B → Screen A (Pass Data Back)

**Question Screen → Welcome Screen (Return Result)**

```dart
// In QuestionScreen - POP with data
Navigator.pop(context, {
  'score': 85,
  'correctAnswers': 8,
  'totalQuestions': 10,
});
```

**In Welcome Screen - Capture returned data:**
```dart
void startQuiz() async {
  // PUSH and wait for result
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const QuestionScreen()),
  );

  if (result != null) {
    print('Score: ${result['score']}');
    print('Correct: ${result['correctAnswers']}');
    // Update UI with results
  }
}
```

---

## 4. State Management with Navigator

### Complete Example for Your Quiz App

**Step 1: Create a Quiz State Model**
```dart
// lib/model/quiz_state.dart
class QuizState {
  int currentQuestionIndex = 0;
  int score = 0;
  List<bool> answers = []; // true = correct, false = wrong

  void selectAnswer(bool isCorrect) {
    answers.add(isCorrect);
    if (isCorrect) score++;
    currentQuestionIndex++;
  }

  bool get isQuizComplete => currentQuestionIndex >= totalQuestions;
  int totalQuestions = 10; // Set this from your data
}
```

**Step 2: Update QuizApp with State**
```dart
// lib/ui/quiz_app.dart
import 'package:flutter/material.dart';
import '../model/quiz_state.dart';
import './screens/welcome_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final QuizState _quizState = QuizState();

  void _startQuiz() {
    // Reset state and push to question screen
    _quizState.currentQuestionIndex = 0;
    _quizState.score = 0;
    _quizState.answers = [];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionScreen(quizState: _quizState),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(onStartQuiz: _startQuiz),
    );
  }
}
```

**Step 3: Update WelcomeScreen**
```dart
// lib/ui/screens/welcome_screen.dart
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStartQuiz;

  const WelcomeScreen({super.key, required this.onStartQuiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Quiz App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Test your knowledge with our exciting quizzes!',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: onStartQuiz,
              child: const Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
```

**Step 4: Update QuestionScreen**
```dart
// lib/ui/screens/question_screen.dart
import 'package:flutter/material.dart';
import '../../model/quiz_state.dart';
import './result_screen.dart';

class QuestionScreen extends StatefulWidget {
  final QuizState quizState;

  const QuestionScreen({super.key, required this.quizState});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final state = widget.quizState;

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${state.currentQuestionIndex + 1}/${state.totalQuestions}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Question ${state.currentQuestionIndex + 1}'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                state.selectAnswer(true); // Correct answer
                _checkQuizCompletion();
              },
              child: const Text('Correct Answer'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                state.selectAnswer(false); // Wrong answer
                _checkQuizCompletion();
              },
              child: const Text('Wrong Answer'),
            ),
          ],
        ),
      ),
    );
  }

  void _checkQuizCompletion() {
    if (widget.quizState.isQuizComplete) {
      // PUSH to result screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(quizState: widget.quizState),
        ),
      );
    } else {
      // Rebuild to show next question
      setState(() {});
    }
  }
}
```

**Step 5: Update ResultScreen**
```dart
// lib/ui/screens/result_screen.dart
import 'package:flutter/material.dart';
import '../../model/quiz_state.dart';

class ResultScreen extends StatelessWidget {
  final QuizState quizState;

  const ResultScreen({super.key, required this.quizState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Quiz Complete!', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text(
              'Score: ${quizState.score}/${quizState.totalQuestions}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              // POP back to welcome screen
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 5. Key Concepts Summary

| Concept | Code | Purpose |
|---------|------|---------|
| **Push** | `Navigator.push(context, route)` | Navigate forward to new screen |
| **Pop** | `Navigator.pop(context)` | Go back to previous screen |
| **Push with Data** | Pass constructor parameters | Send data to new screen |
| **Pop with Data** | `Navigator.pop(context, data)` | Return data to previous screen |
| **Await Pop** | `await Navigator.push()` | Wait and capture returned data |
| **State Sharing** | Pass state object to screens | Share state across screens |

---

## 6. Navigation Flow Diagram

```
WelcomeScreen
    ↓ (PUSH with QuizState)
QuestionScreen
    ↓ (PUSH with QuizState)
ResultScreen
    ↓ (POP back)
WelcomeScreen
```

---

## 7. Common Mistakes to Avoid

❌ **Don't:** Use `Navigator.pop()` on the first screen (will crash)  
✅ **Do:** Check if there's a previous screen first

❌ **Don't:** Forget to make screens `StatefulWidget` if they need setState  
✅ **Do:** Use `StatefulWidget` when you need to update UI

❌ **Don't:** Create new state objects during rebuild  
✅ **Do:** Store state in parent widget and pass down

---

## 8. Quick Reference

```dart
// Push to new screen
Navigator.push(context, MaterialPageRoute(builder: (_) => NewScreen()));

// Pop back
Navigator.pop(context);

// Push and get result
final result = await Navigator.push(context, MaterialPageRoute(...));

// Pop with data
Navigator.pop(context, {'key': 'value'});

// Pass state to child
ChildScreen(quizState: _quizState)
```

