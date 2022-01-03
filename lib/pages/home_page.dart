import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 49.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 26.75,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Books',
      amount: 19.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Transportation',
      amount: 34.45,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Coffee',
      amount: 11.35,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showTransactionInput(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // CHART
            const SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 4.0,
                child: Text('CHART'),
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showTransactionInput(context),
      ),
    );
  }

  void _addTransaction({
    required String title,
    required double amount,
  }) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _showTransactionInput(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {},
          child: NewTransaction(_addTransaction),
        );
      },
    );
  }
}
