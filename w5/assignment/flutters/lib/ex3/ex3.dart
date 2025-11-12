import 'package:flutter/material.dart';

// PART 2 - Product Enum
enum Product {
  dart(
    title: 'Dart',
    description: 'The best Object language',
    imagePath: 'assets/ex3/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'The best mobile widget library',
    imagePath: 'assets/ex3/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'The best Clound database',
    imagePath: 'assets/ex3/firebase.png',
  );

  final String title;
  final String description;
  final String imagePath;

  const Product({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

// PART 3 - ProductCard Widget
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
  
        children: [
          // Image
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Colors.grey[300],
            ),
            child: Image.asset(
              product.imagePath,
              // fit: BoxFit.cover,
              alignment: Alignment.topLeft,
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Description
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
