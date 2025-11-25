import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];
List<String> numbers = ["MON", "TUE", "WED", "THU"];
List<Widget> getLabels() {
  return numbers.map((item) => Text(item)).toList();
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const Label("Method 1: Loop in Array", bold: true),
              // TODO
              Column(
                children: [
                  const Text("Start"),
                  for (String colors in colors) Text(colors),
                  const Text("End"),
                ],
              ),
              const Label("Method 2: Map", bold: true),
              // TODO
              Column(
                children: [
                  const Text(
                    "Start",
                  ),
                  ...numbers.map((item) => Text(item)).toList(),
                  const Text("End")
                ]
                
              ),
              const Label("Method 23: Dedicated Function", bold: true),
              // TODO
              Column (
                children: [
                  const Text("Start"),
                  ...getLabels(),
                  const Text("End"),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
