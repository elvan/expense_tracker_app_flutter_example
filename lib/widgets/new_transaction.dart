import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTransaction;

  NewTransactions(this.addTransaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              keyboardType: TextInputType.text,
              onSubmitted: (_) => _submitData,
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) => _submitData,
            ),
            FlatButton(
              textColor: Colors.purple,
              onPressed: _submitData,
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTransaction(
      title: enteredTitle,
      amount: enteredAmount,
    );
  }
}
