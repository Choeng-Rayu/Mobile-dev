// ignore: file_names
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(50.0),
          padding: const EdgeInsets.all(50.0),
          color: Colors.blue[300],
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Center(
              child: Text(
                'CADT STUDENTS',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    )
  );
}