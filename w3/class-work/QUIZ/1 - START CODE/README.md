# Quiz Application - Testing Guide

## Table of Contents
1. [Project Overview](#project-overview)
2. [How to Write Tests in Dart](#how-to-write-tests-in-dart)
3. [Running Tests](#running-tests)
4. [Troubleshooting: Permission Errors](#troubleshooting-permission-errors)
5. [Test Examples for Quiz Application](#test-examples-for-quiz-application)

---

## Project Overview

This is a Quiz application built with Dart that includes:
- **Question** class - Represents a quiz question with choices and correct answer
- **Answer** class - Represents a user's answer to a question
- **Quiz** class - Manages questions, answers, and score calculation

---

## How to Write Tests in Dart

### Basic Test Structure

```dart
import 'package:test/test.dart';

void main() {
  test('description of what you are testing', () {
    // 1. ARRANGE - Setup your data
    int x = 2 + 2;
    
    // 2. ACT - Execute the code (if needed)
    
    // 3. ASSERT - Verify the results
    expect(x, equals(4));
  });
}
```

### Key Components

#### 1. Import the Test Package
```dart
import 'package:test/test.dart';
```

#### 2. Use `test()` Function
- **First parameter**: Description string (what you're testing)
- **Second parameter**: Callback function containing test logic

#### 3. Use `expect()` for Assertions
```dart
expect(actualValue, matcher);
```

### Common Matchers

| Matcher | Description | Example |
|---------|-------------|---------|
| `equals(value)` | Exact equality | `expect(x, equals(4))` |
| `isTrue` | Value is true | `expect(flag, isTrue)` |
| `isFalse` | Value is false | `expect(flag, isFalse)` |
| `isNull` | Value is null | `expect(value, isNull)` |
| `isNotNull` | Value is not null | `expect(value, isNotNull)` |
| `greaterThan(n)` | Value > n | `expect(x, greaterThan(3))` |
| `lessThan(n)` | Value < n | `expect(x, lessThan(10))` |
| `isNot(matcher)` | Negates a matcher | `expect(x, isNot(equals(5)))` |
| `contains(item)` | List/String contains | `expect([1,2,3], contains(2))` |

### Grouping Tests

Organize related tests using `group()`:

```dart
void main() {
  group('Question Tests', () {
    test('should create question', () { ... });
    test('should store choices', () { ... });
  });

  group('Answer Tests', () {
    test('should identify correct answer', () { ... });
    test('should identify wrong answer', () { ... });
  });
}
```

---

## Running Tests

### Run All Tests
```bash
dart test
```

### Run Specific Test File
```bash
dart test test/quiz_test.dart
```

### Expected Output (Success)
```
00:01 +1: All tests passed!
```

### Expected Output (Failure)
```
00:01 +0 -1: Test description [E]
  Expected: <5>
    Actual: <4>
```

---

## Troubleshooting: Permission Errors

### Common Error

If you see this error:
```
PathAccessException: Cannot open file, path = '.../pubspec.lock'
(OS Error: Permission denied, errno = 13)
```

**Cause**: The directory or files are **read-only**, preventing Dart from writing necessary files.

### Solution: Fix Permissions

#### Step 1: Check Current Permissions
```bash
ls -la
```

Look for directories without write permission (missing 'w'):
```
dr-xr-xr-x   # ❌ READ-ONLY (no 'w')
drwxr-xr-x   # ✅ HAS WRITE PERMISSION
```

#### Step 2: Add Write Permissions
```bash
# Navigate to your project directory
cd "/home/choeng-rayu/academic/Year3/Mobile-dev/w3/assignement/1 - START CODE (1)/1 - START CODE"

# Add write permissions recursively
chmod -R u+w .
```

Or specify the full path:
```bash
chmod -R u+w "/home/choeng-rayu/academic/Year3/Mobile-dev/w3/assignement/1 - START CODE (1)/1 - START CODE"
```

#### Step 3: Verify Fix
```bash
ls -la
```

You should now see 'w' in the permissions:
```
drwxr-xr-x   # Write permission added ✅
```

#### Step 4: Run Tests Again
```bash
dart test
```

### Understanding `chmod` Command

```bash
chmod [options] [permissions] [file/directory]
```

**Common Options:**
- `-R` : Recursive (apply to all subdirectories and files)
- `u` : User (you, the owner)
- `+w` : Add write permission

**Examples:**
```bash
chmod u+w file.txt          # Add write permission to file
chmod -R u+w folder/        # Add write permission recursively
chmod 755 directory/        # Set specific permissions (rwxr-xr-x)
```

### When You'll Need This

- Extracting zip files (may create read-only files)
- Copying from USB drives or read-only sources
- Running `dart pub get` or `dart test` for the first time
- Working with files from different operating systems

---

## Test Examples for Quiz Application

### Example 1: Testing Question Creation
```dart
test('Question should be created with all properties', () {
  // Arrange
  Question question = Question(
    title: 'What is 2+2?',
    choices: ['3', '4', '5'],
    goodChoice: '4'
  );
  
  // Assert
  expect(question.title, equals('What is 2+2?'));
  expect(question.choices.length, equals(3));
  expect(question.goodChoice, equals('4'));
});
```

### Example 2: Testing Correct Answer
```dart
test('Answer.isGood() should return true for correct answer', () {
  // Arrange
  Question question = Question(
    title: 'What is the capital of France?',
    choices: ['London', 'Paris', 'Berlin'],
    goodChoice: 'Paris'
  );
  Answer answer = Answer(
    question: question, 
    answerChoice: 'Paris'
  );
  
  // Act & Assert
  expect(answer.isGood(), isTrue);
});
```

### Example 3: Testing Wrong Answer
```dart
test('Answer.isGood() should return false for wrong answer', () {
  // Arrange
  Question question = Question(
    title: 'What is the capital of France?',
    choices: ['London', 'Paris', 'Berlin'],
    goodChoice: 'Paris'
  );
  Answer answer = Answer(
    question: question, 
    answerChoice: 'London'
  );
  
  // Act & Assert
  expect(answer.isGood(), isFalse);
});
```

### Example 4: Testing Quiz Score (100%)
```dart
test('Quiz should calculate 100% score for all correct answers', () {
  // Arrange
  Question q1 = Question(title: 'Q1', choices: ['A', 'B'], goodChoice: 'A');
  Question q2 = Question(title: 'Q2', choices: ['C', 'D'], goodChoice: 'C');
  Quiz quiz = Quiz(questions: [q1, q2]);
  
  quiz.addAnswer(Answer(question: q1, answerChoice: 'A'));
  quiz.addAnswer(Answer(question: q2, answerChoice: 'C'));
  
  // Act
  int score = quiz.getScoreInPercentage();
  
  // Assert
  expect(score, equals(100));
});
```

### Example 5: Testing Quiz Score (50%)
```dart
test('Quiz should calculate 50% score for half correct answers', () {
  // Arrange
  Question q1 = Question(title: 'Q1', choices: ['A', 'B'], goodChoice: 'A');
  Question q2 = Question(title: 'Q2', choices: ['C', 'D'], goodChoice: 'C');
  Quiz quiz = Quiz(questions: [q1, q2]);
  
  quiz.addAnswer(Answer(question: q1, answerChoice: 'A')); // Correct
  quiz.addAnswer(Answer(question: q2, answerChoice: 'D')); // Wrong
  
  // Act
  int score = quiz.getScoreInPercentage();
  
  // Assert
  expect(score, equals(50));
});
```

### Example 6: Testing Adding Answers
```dart
test('Quiz should add answers correctly', () {
  // Arrange
  Question q1 = Question(
    title: 'Question 1',
    choices: ['A', 'B', 'C'],
    goodChoice: 'A'
  );
  Quiz quiz = Quiz(questions: [q1]);
  Answer answer = Answer(question: q1, answerChoice: 'A');
  
  // Act
  quiz.addAnswer(answer);
  
  // Assert
  expect(quiz.answers.length, equals(1));
  expect(quiz.answers[0], equals(answer));
});
```

---

## Best Practices for Writing Tests

1. **One Test, One Thing** - Each test should verify a single behavior
2. **Descriptive Names** - Use clear descriptions that explain what you're testing
3. **AAA Pattern** - Arrange (setup), Act (execute), Assert (verify)
4. **Test Edge Cases** - Empty lists, null values, boundary conditions
5. **Independent Tests** - Tests shouldn't depend on each other
6. **Test Both Paths** - Success cases AND failure/error cases

---

## Quick Reference

### Fix Permission Error
```bash
chmod -R u+w .
```

### Run Tests
```bash
dart test
```

### Basic Test Template
```dart
test('description', () {
  // Arrange
  var data = setupData();
  
  // Act
  var result = doSomething(data);
  
  // Assert
  expect(result, equals(expected));
});
```

---

## Additional Resources

- [Dart Test Package Documentation](https://pub.dev/packages/test)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Unit Testing Best Practices](https://dart.dev/guides/testing)

---

**Last Updated:** October 18, 2025
