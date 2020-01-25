import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/transaction.dart';
import '../widget/no_transactions.dart';
import '../widget/transaction_card.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> _transactions;

  Transactions(this._transactions);

  @override
  Widget build(BuildContext context) {
    List<Widget> _transactionsCards = [];

    _transactions.forEach((tx) {
      TransactionCard transactionCard = TransactionCard(tx);
      _transactionsCards.add(transactionCard);
    });

    return Container(
      height: 450,
      child: _transactionsCards.isEmpty
          ? NoTransactions()
          : ListView(
              children: _transactionsCards,
            ),
    );
  }
}
