import 'package:flutter/material.dart';

class ClassroomWork extends StatelessWidget {
  const ClassroomWork({super.key, required this.classroomId});

  final String classroomId;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 66, 82, 66),
      child: Center(
        child: Text("List of students for classroom $classroomId"),
      ),
    );
  }
}
