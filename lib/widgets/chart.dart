import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import '../models/transactions.dart';
import 'package:intl/intl.dart';
import '../widgets/char_bar.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double totalSum = 0.0;
        for (var i = 0; i < recentTransaction.length; i++) {
          if (recentTransaction[i].date.day == weekDay.day &&
              recentTransaction[i].date.month == weekDay.month &&
              recentTransaction[i].date.year == weekDay.year) {
            totalSum += recentTransaction[i].amount;
          }
        }
        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum,
        };
      },
    ).reversed.toList();
  }

  double get TotaltSpending {
    return groupedTransactionsValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionsValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'],
                  data['amount'],
                  (TotaltSpending == 0.0)
                      ? 0.0
                      : (data['amount'] as double) / TotaltSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
