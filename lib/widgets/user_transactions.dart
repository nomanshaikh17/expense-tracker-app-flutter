import 'package:flutter/material.dart';
import '../widgets/transactions_list.dart';
import '../widgets/new_tranaction.dart';
import '../models/transactions.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transactions> transaction = [
    Transactions(
      id: 't1',
      title: 'fun',
      amount: 50.5,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't2',
      title: 'fuel',
      amount: 98.0,
      date: DateTime.now(),
    ),
  ];

  void addNewTransaction(String title, double amount) {
    final newTx = Transactions(
      amount: amount,
      title: title,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      transaction.add(newTx);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addNewTransaction),
        TransactionList(
          transaction: transaction,
        )
      ],
    );
  }
}
