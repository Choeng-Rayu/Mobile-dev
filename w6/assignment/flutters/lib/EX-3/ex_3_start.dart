import 'package:flutter/material.dart';

const List<String> images = [
  "lib/EX-3/w4-s2/bird.jpg",
  "lib/EX-3/w4-s2/bird2.jpg",
  "lib/EX-3/w4-s2/insect.jpg",
  "lib/EX-3/w4-s2/girl.jpg",
  "lib/EX-3/w4-s2/man.jpg",
];

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ? answer:  this line is just the show the UI at the appBar that the debug mode is not appears
  // debugShowCheckedModeBanner: false removes the "DEBUG" banner in the top-right corner during development
  home: ActiveButton(),
));
class ActiveButton extends StatefulWidget {
  const ActiveButton({super.key});

  @override
  State<ActiveButton> createState() => _ActiveButtonState();
}

class _ActiveButtonState extends State<ActiveButton> {
  int currentIndex = 0;
  void nextImage(){
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }
  void previousImage(){
    setState(() {
      currentIndex = (currentIndex - 1 + images.length) % images.length;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: MyAppBar(
        currentIndex: currentIndex,
        onPrevious: previousImage,
        onNext: nextImage,
      ),
      body: Image.asset(images[currentIndex]),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  const MyAppBar({
    super.key,
    required this.currentIndex,
    required this.onNext,
    required this.onPrevious
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green[400],
      title: const Text('Image viewer'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.navigate_before),
          tooltip: 'Go to the previous image',
          onPressed: onPrevious,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
          child: IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next image',
            onPressed: onNext,
          ),
        ),
      ],
    );
  }
}
