import 'package:flutter/material.dart';

void main() {
  runApp(const AlignmentExampleApp());
}

class AlignmentExampleApp extends StatelessWidget {
  const AlignmentExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alignment Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const AlignmentExampleScreen(),
    );
  }
}

class AlignmentExampleScreen extends StatefulWidget {
  const AlignmentExampleScreen({super.key});

  @override
  State<AlignmentExampleScreen> createState() => _AlignmentExampleScreenState();
}

class _AlignmentExampleScreenState extends State<AlignmentExampleScreen> {
  int selectedExample = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alignment Examples'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Selector buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => selectedExample = 0),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedExample == 0 ? Colors.blue : Colors.grey[300],
                  ),
                  child: Text(
                    'Example 1',
                    style: TextStyle(
                      color: selectedExample == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => selectedExample = 1),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedExample == 1 ? Colors.blue : Colors.grey[300],
                  ),
                  child: Text(
                    'Example 2',
                    style: TextStyle(
                      color: selectedExample == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => selectedExample = 2),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedExample == 2 ? Colors.blue : Colors.grey[300],
                  ),
                  child: Text(
                    'Example 3',
                    style: TextStyle(
                      color: selectedExample == 2 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => selectedExample = 3),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedExample == 3 ? Colors.blue : Colors.grey[300],
                  ),
                  child: Text(
                    'Example 4',
                    style: TextStyle(
                      color: selectedExample == 3 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Display selected example
          Expanded(
            child: _buildExample(selectedExample),
          ),
        ],
      ),
    );
  }

  Widget _buildExample(int exampleIndex) {
    switch (exampleIndex) {
      case 0:
        return _example1ShoppingCart();
      case 1:
        return _example2ChatMessage();
      case 2:
        return _example3ProfileCard();
      case 3:
        return _example4NotificationBanner();
      default:
        return Container();
    }
  }

  // Example 1: Shopping Cart Item
  Widget _example1ShoppingCart() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Example 1: Shopping Cart Item',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.shopping_bag,
                      size: 40, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nike Shoes',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Size: 10 | Color: Black',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const Text(
                  '\$99.99',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'mainAxisAlignment: start → Items align to LEFT\n'
            'crossAxisAlignment: center → Items centered VERTICALLY',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Example 2: Chat Message
  Widget _example2ChatMessage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Example 2: Chat Message with Icon',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.orange,
                child: const Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Hey! How are you doing today? 😊',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '2:30 PM',
                      style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_vert, color: Colors.grey[400]),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'mainAxisAlignment: spaceBetween → Space between avatar, message, and menu\n'
            'crossAxisAlignment: start → All items aligned to TOP',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Example 3: Profile Card
  Widget _example3ProfileCard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Example 3: Profile Card',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.purple, width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.purple,
                  child: const Text(
                    'AB',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Alex Brown',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Software Engineer',
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 24),
                    const SizedBox(height: 4),
                    Text(
                      '4.8',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'mainAxisAlignment: spaceEvenly → Equal space around all items\n'
            'crossAxisAlignment: center → All items centered VERTICALLY',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Example 4: Notification Banner
  Widget _example4NotificationBanner() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Example 4: Notification Banner',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.red, width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(Icons.warning, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Warning!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Your session will expire in 5 minutes. Please save your work.',
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.close, color: Colors.grey[600]),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'mainAxisAlignment: start → Icon and message align to LEFT\n'
            'crossAxisAlignment: start → All items aligned to TOP',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
