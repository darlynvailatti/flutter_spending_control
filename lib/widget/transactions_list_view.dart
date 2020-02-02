import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/transaction.dart';
import '../widget/no_transactions.dart';
import '../widget/transaction_card.dart';

class TransactionsListView extends StatelessWidget {

  final Function deleteTransactionHandler;
  final List<Transaction> _transactions;

  TransactionsListView(this._transactions, this.deleteTransactionHandler);

  @override
  Widget build(BuildContext context) {

    List<Widget> _transactionsCards = [];
    List<Transaction> transactions = _transactions;

    transactions.forEach((tx) {
      TransactionCard transactionCard = TransactionCard(tx, deleteTransactionHandler);
      _transactionsCards.add(transactionCard);
    });

    return Container(
      child: _transactionsCards.isEmpty
          ? NoTransactions()
          : ListView( children: _transactionsCards,),
    );
  }
}
