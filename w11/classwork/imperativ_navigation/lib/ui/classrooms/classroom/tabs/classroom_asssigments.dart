import 'package:flutter/material.dart';

class ClassroomAssigments extends StatelessWidget {
  const ClassroomAssigments({super.key, required this.classroomId});

  final String classroomId;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[600],
      child: Center(child: Text("Assigments for classroom $classroomId")),
    );
  }
}
