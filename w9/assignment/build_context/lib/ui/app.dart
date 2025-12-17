import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'expenses/expense_form.dart';
import 'expenses/expenses.dart';
import 'statisticSummary/categories.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Expense> expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  Expense? _lastRemovedExpense;
  int? _lastRemovedIndex;

  void addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    setState(() {
      _lastRemovedIndex = expenses.indexOf(expense);
      _lastRemovedExpense = expense;
      expenses.remove(expense);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense removed'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              if (_lastRemovedExpense != null && _lastRemovedIndex != null) {
                expenses.insert(_lastRemovedIndex!, _lastRemovedExpense!);
              }
            });
          },
        ),
      ),
    );
  }

  void onAddClicked(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: false,
      context: context,
      builder: (c) => ExpenseForm(
        onExpenseCreated: addExpense,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {onAddClicked(context)},
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: Column(
        children: [
          CategoriesSummary(
            expenses: expenses,
          ),
          Expanded(
            child: expenses.isEmpty
                ? Center(
                    child: Text(
                      'No expenses yet. Add one to get started!',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  )
                : ExpensesView(
                    expenses: expenses,
                    onRemove: removeExpense,
                  ),
          ),
        ],
      ),
    );
  }
}
