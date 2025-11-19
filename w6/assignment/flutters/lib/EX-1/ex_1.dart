import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: MyApp(),
    ));

// Model/Data Class
class ButtonItem {
  String label;
  bool isSelected;

  ButtonItem({
    required this.label,
    this.isSelected = false,
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class CustomButton extends StatelessWidget {
  final ButtonItem buttonItem;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.buttonItem,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              buttonItem.isSelected ? Colors.blue[500] : Colors.blue[50],
        ),
        child: Center(
          child: Text(
            buttonItem.label,
            style: TextStyle(
              color: buttonItem.isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class _MyAppState extends State<MyApp> {
  late List<ButtonItem> buttonItems;

  @override
  void initState() {
    super.initState();

    buttonItems = [
      ButtonItem(label: "Not Selected"),
      ButtonItem(label: "Not Selected"),
      ButtonItem(label: "Not Selected"),
      ButtonItem(label: "Not Selected"),
    ];
  }

  void toggleSelection(int index) {
    setState(() {
      buttonItems[index].isSelected = !buttonItems[index].isSelected;

      // Update label text dynamically
      buttonItems[index].label = buttonItems[index].isSelected ? "Selected" : "Not Selected";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Buttons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            buttonItems.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomButton(
                buttonItem: buttonItems[index],
                onPressed: () => toggleSelection(index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
