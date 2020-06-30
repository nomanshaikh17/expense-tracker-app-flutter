import 'package:expensetracker/widgets/new_tranaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/transactions_list.dart';
import './models/transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'My Expense Tracker',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'QuickSand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Expense Tracker"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text("chart"),
              color: Colors.blue,
              elevation: 10,
            ),
          ),
          TransactionList(
            transaction: transaction,
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
