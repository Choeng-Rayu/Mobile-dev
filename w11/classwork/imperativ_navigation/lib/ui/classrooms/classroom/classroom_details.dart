import 'package:flutter/material.dart';

import 'tabs/classroom_asssigments.dart';
import 'tabs/classroom_feeds.dart';
import 'tabs/classroom_students.dart';

class ClassroomDetails extends StatefulWidget {
  const ClassroomDetails({super.key, required this.classroomId});

  final String classroomId;

  @override
  State<ClassroomDetails> createState() => _ClassroomDetailsState();
}

enum ClassroomTab { feedTab, studentsTab, assigmentTab }

class _ClassroomDetailsState extends State<ClassroomDetails> {
  ClassroomTab _currentTab = ClassroomTab.feedTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Classroom ${widget.classroomId}')),
      body: IndexedStack(
        index: _currentTab.index,
        children: [
          ClassroomFeeds(classroomId: widget.classroomId),
          ClassroomStudents(classroomId: widget.classroomId),
          ClassroomAssigments(classroomId: widget.classroomId),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        currentIndex: _currentTab.index,
        onTap: (index) {
          setState(() {
            _currentTab = ClassroomTab.values[index];
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Students'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Assignments',
          ),
        ],
      ),
    );
  }
}
