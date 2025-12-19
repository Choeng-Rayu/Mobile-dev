import 'package:flutter/material.dart';

class ClassroomStudents extends StatelessWidget {
  const ClassroomStudents({super.key, required this.classroomId});

  final String classroomId;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[200],
      child: Center(
        child: Text("List of students for classroom $classroomId"),
      ),
    );
  }
}
