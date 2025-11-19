import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
        debugShowCheckedModeBanner: true,
        home: ScorePage()
    ),
  );
}

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ScoreCard(title: "My score in Flutter"),
              SizedBox(height: 30),
              ScoreCard(title: "My score in Dart", initialValue: 30),
              SizedBox(height: 30),
              ScoreCard(title: "My score in React", initialValue: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  final String title;
  final double initialValue;

  const ScoreCard({super.key, required this.title, this.initialValue = 0});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late double value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }
  void addScore() {
    setState(() {
      if (value < 100) {
        value += 10;
      }
    });
  }
  void subtractScore(){
    setState(() {
      if(value > 0){
        value -= 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(color: Colors.grey, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: subtractScore,
                child: const Icon(
                  Icons.remove,
                  size: 40,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: addScore,
                child: const Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          // Progress Bar
          ProgressBar(value: value),
        ],
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Container(
                // duration: const Duration(milliseconds: 300),
                width: constraints.maxWidth * (value / 100),
                decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}