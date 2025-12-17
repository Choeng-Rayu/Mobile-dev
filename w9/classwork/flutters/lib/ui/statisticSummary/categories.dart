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

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   padding: const EdgeInsets.all(16),
    //   // color: Colors.grey,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       CategoryCard(
    //         amount: getCategoryTotal(Category.leisure),
    //         icon: Icons.movie,
    //         label: 'Leisure',
    //       ),
    //       CategoryCard(
    //         amount: getCategoryTotal(Category.work),
    //         icon: Icons.work,
    //         label: 'Work',
    //       ),
    //       CategoryCard(
    //         amount: getCategoryTotal(Category.travel),
    //         icon: Icons.travel_explore,
    //         label: 'Travel',
    //       ),
    //       CategoryCard(
    //         amount: getCategoryTotal(Category.food),
    //         icon: Icons.free_breakfast,
    //         label: 'Food',
    //       ),
    //     ],
    //   ),
    // );
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        color: const Color.fromARGB(255, 221, 218, 218),
        child: Column(
          children: [
            Text(
              'Category Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryCard(
                  amount: getCategoryTotal(Category.leisure),
                  icon: Icons.holiday_village,
                  label: 'Leisure',
                ),
                CategoryCard(
                  amount: getCategoryTotal(Category.work),
                  icon: Icons.work,
                  label: 'Work',
                ),
                CategoryCard(
                  amount: getCategoryTotal(Category.travel),
                  icon: Icons.travel_explore,
                  label: 'Travel',
                ),
                CategoryCard(
                  amount: getCategoryTotal(Category.food),
                  icon: Icons.free_breakfast,
                  label: 'Food',
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
        border: Border.all(color: Colors.cyan, width: 2),
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

