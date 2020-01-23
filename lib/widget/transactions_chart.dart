
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spending_control/model/transaction.dart';
import 'package:flutter_spending_control/widget/chart.dart';

class TransactionsChart extends StatelessWidget{

  final List<Transaction> _transactions;

  TransactionsChart(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Chart(_transactions),
    );
  }

}