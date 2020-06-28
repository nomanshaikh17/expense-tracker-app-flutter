import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Appbar"),
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
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
