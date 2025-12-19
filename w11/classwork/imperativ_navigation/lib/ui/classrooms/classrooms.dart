import 'package:flutter/material.dart';

import '../../utils/animations_util.dart';
import 'classroom/classroom_details.dart';

class Classrooms extends StatelessWidget {
  const Classrooms({super.key});

  onClassroomSelected(String classroomId, BuildContext context) async {
    // 3 - Navigate to the rides screen (with a buttom to top animation)

    await Navigator.of(context).push(
      AnimationUtils.createTopToBottomRoute(
        ClassroomDetails(classroomId: classroomId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final classrooms = [
      'Flutter – Group 1',
      'Algorithms – Group 7',
      'Web Dev – Group 3',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Classrooms')),
      body: ListView.builder(
        itemCount: classrooms.length,
        itemBuilder: (context, index) {
          final classroom = classrooms[index];

          return ListTile(
            leading: const Icon(Icons.class_),
            title: Text(classroom),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Go to the  ClassroomDetails

              onClassroomSelected(classroom, context);
            },
          );
        },
      ),
    );
  }
}
