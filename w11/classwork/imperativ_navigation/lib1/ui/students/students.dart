import 'package:flutter/material.dart';
import 'studentDetail/studentDetail.dart';

class Students extends StatelessWidget {
  const Students({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return const Placeholder();
  // }
  @override
  Widget build(BuildContext context) {
    final student = [
      'Student 1',
      'Student 2',
      'Student 3',
    ];
    
    return Scaffold(
      appBar: AppBar(title: const Text('Students')),
      body: ListView.builder(
        itemCount: student.length,
        itemBuilder: (context, index) {
          final studentDetail = student[index];

          return ListTile(
            leading: const Icon(Icons.class_),
            title: Text(studentDetail),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Go to the  StudentsDetails
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StudentDetails(studentId: studentDetail),
                ),
              );
            },
          );
        },
      ),
    );
  }

}