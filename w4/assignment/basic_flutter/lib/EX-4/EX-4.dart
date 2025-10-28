// ignore: file_names
import 'package:flutter/material.dart';

void main(){
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: MyApp(),
      ),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      color: Colors.grey[200],
      child: Center(
        child: Column(
          children: [
            CustomCard(
              title: 'OOP',
              color: Colors.blue[100]!,
            ),
            CustomCard(
              title: 'DART',
              color: Colors.blue[300]!,
            ),
            const CustomCard(
              title: 'FLUTTER',
              useGradient: true,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final Color? color;
  final bool useGradient;

  const CustomCard({
    Key? key,
    required this.title,
    this.color,
    this.useGradient = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: useGradient ? null : color,
        gradient: useGradient
            ? LinearGradient(
                colors: [Colors.blue[300]!, Colors.blue[600]!],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}