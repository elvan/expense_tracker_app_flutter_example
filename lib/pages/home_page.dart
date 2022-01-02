import 'package:flutter/material.dart';

import '../widgets/user_transactions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            // CHART
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 4.0,
                child: Text('CHART'),
              ),
            ),
            UserTransactions()
          ],
        ),
      ),
    );
  }
}
