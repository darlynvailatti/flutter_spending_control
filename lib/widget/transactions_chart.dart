import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spending_control/model/transaction.dart';
import 'package:flutter_spending_control/model/transaction_amount_controller.dart';
import 'package:flutter_spending_control/widget/chart.dart';

class TransactionsChart extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionsChart(this._transactions);

  @override
  Widget build(BuildContext context) {
    var transactionAmountController = TransactionAmountController(_transactions);
    return Card(
      child: Chart(transactionAmountController),
    );
  }
}
