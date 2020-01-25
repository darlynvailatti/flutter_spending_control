import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/transaction.dart';
import '../model/transaction_amount_controller.dart';
import '../widget/chart.dart';

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
