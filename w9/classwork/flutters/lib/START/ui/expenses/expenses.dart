import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpensesView extends StatelessWidget {
  final List<Expense> expenses;
  final Function(Expense)? onRemove;

  const ExpensesView({
    super.key,
    required this.expenses,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index].id),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          onRemove?.call(expenses[index]);
        },
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          color: Colors.red,
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        child: ExpenseItem(
          expense: expenses[index],
          onRemove: () => onRemove?.call(expenses[index]),
        ),
      ),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.expense,
    required this.onRemove,
  });

  final Expense expense;
  final VoidCallback onRemove;

  IconData get expenseIcon {
    switch (expense.category) {
      case Category.food:
        return Icons.free_breakfast;
      case Category.travel:
        return Icons.travel_explore;
      case Category.leisure:
        return Icons.holiday_village;
      case Category.work:
        return Icons.work;
    }
  }

  String get expenseDate {
    return "${expense.date.day}/${expense.date.month}/${expense.date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$${expense.amount.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.green[700],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(expenseIcon),
                ),
                Text(expenseDate),
                SizedBox(width: 10),
                IconButton(
                  onPressed: onRemove,
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
