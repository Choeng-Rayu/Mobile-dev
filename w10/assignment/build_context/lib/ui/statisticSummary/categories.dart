import 'package:flutter/material.dart';
import '../../models/expense.dart';

class CategoriesSummary extends StatelessWidget {
  const CategoriesSummary({required this.expenses});
  final List<Expense> expenses;

  double getCategoryTotal(Category category) {
    return expenses
        .where((expense) => expense.category == category)
        .fold(0.0, (sum, expense) => sum + expense.amount);
  }

  IconData getCategoryIcon(Category category) {
    switch (category) {
      case Category.leisure:
        return Icons.holiday_village;
      case Category.work:
        return Icons.work;
      case Category.travel:
        return Icons.travel_explore;
      case Category.food:
        return Icons.free_breakfast;
    }
  }

  String getCategoryLabel(Category category) {
    switch (category) {
      case Category.leisure:
        return 'Leisure';
      case Category.work:
        return 'Work';
      case Category.travel:
        return 'Travel';
      case Category.food:
        return 'Food';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.cyan, width: 2),
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 221, 218, 218),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (final category in Category.values)
                  CategoryCard(
                    amount: getCategoryTotal(category),
                    icon: getCategoryIcon(category),
                    label: getCategoryLabel(category),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.amount,
    required this.icon,
    required this.label,
  });

  final double amount;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Icon(icon, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

