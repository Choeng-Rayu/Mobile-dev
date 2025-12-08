import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';


class ExpenseForm extends StatefulWidget {
  final Function(Expense)? onExpenseCreated;

  const ExpenseForm({super.key, this.onExpenseCreated});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  

    void onCreate() {
    final expense = Expense(
      title: _titleController.text,
      amount: double.parse(_amountController.text),
      date: DateTime.now(),
      category: Category.food,
    );
    widget.onExpenseCreated?.call(expense);
    Navigator.pop(context);
    print('The Amount is ${_amountController.text}');
    print('The Title is ${_titleController.text}');
    print('The form is created');
  }
  
  // void submitExpense(){
  //   set
  // }
  void onCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              prefix: Text('\$'),
              label: Text("Amount"),
            ),
            maxLength: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: [
              ElevatedButton(onPressed: onCreate, child: Text("Create")),
              ElevatedButton(onPressed: onCancel, child: Text("Cancel")),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
    print('The form is dispose');
  }
}
