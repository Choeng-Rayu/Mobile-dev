import 'package:flutter/material.dart';
 
import 'expenses/expenses.dart';
import '../models/expense.dart';
import '../models/expense_form.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  final List<Expense> _expenses = [
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

  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void _openAddExpenseModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext modalContext) {
        return ExpenseForm(onAddExpense: _addExpense);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseModal,
          )
        ],
      ),
      body: ExpensesView(expenses: _expenses),
    );
  }
}











// // teacher correction version 


// import 'package:flutter/material.dart';

// import 'expenses/expenses.dart';

// class App extends StatelessWidget {
//   const App({super.key});

//   void onAddClicked(BuildContext context) {
  
//     showModalBottomSheet(
//       isScrollControlled: false,
//       context: context,
//       builder: (c) => Center(
//         child: Container(
//           padding: EdgeInsets.all(30),
//           color: Colors.blue,
//           child: ElevatedButton(onPressed: ()=> {Navigator.pop(context)}, child: Text("Close me")),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[100],
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () => {onAddClicked(context)},
//             icon: Icon(Icons.add),
//           ),
//         ],
//         backgroundColor: Colors.blue[700],
//         title: const Text('Ronan-The-Best Expenses App'),
//       ),
//       body: ExpensesView(),
//     );
//   }
// }