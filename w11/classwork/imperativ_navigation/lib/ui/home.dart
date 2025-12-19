import 'package:flutter/material.dart';
 
import 'classrooms/classrooms.dart';
import 'students/students.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('LMS Home')),
      appBar: AppBar(title: const Text('LMS Home')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [

            
            // const DrawerHeader(
            //   decoration: BoxDecoration(color: Colors.blue),
            //   child: Text('Menu'),
            // ),
            // ListTile(
            //   title: const Text('Classrooms'),
            //   onTap: () {
            //     // Update the state of the app.
            //     // ...
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const Classrooms()),
            //     );
            //   },
            // ),
            // ListTile(
            //   title: const Text('Students'),
            //   onTap: () {
            //     // Update the state of the app.
            //     // ...
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const Classrooms()),
            //     );
            //   },
              
            // ),
            // ListTile(
            //   title: const Text('Students'),
            //   onTap: () {
            //     // Update the state of the app.
            //     // ...
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const Students()),
            //     );
            //   },
            // ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _HomeButton(
              label: 'Classrooms',
              icon: Icons.class_,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Classrooms()),
                );
              },
            ),
            const SizedBox(height: 16),
            _HomeButton(
              label: 'Students',
              icon: Icons.people,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Students()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _HomeButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton.icon(
          icon: Icon(icon),
          label: Text(label),
          onPressed: onTap,
        ),
      ),
    );
  }
}
