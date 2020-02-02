import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/transaction.dart';
import '../util/date_util.dart';

class TransactionCard extends StatelessWidget {

  final Function _deleteTransactionHandler;
  final Transaction _transaction;
  final double _amountContainerWith = 140;

  TransactionCard(this._transaction, this._deleteTransactionHandler);

  Text _getAmountText(BuildContext context) {
    return Text(
      '\$${_transaction.amount.toStringAsFixed(2)}',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 10,
        color: Theme.of(context).buttonColor,
      ),
    );
  }

  Text _getDescriptionText() {
    return Text(
      _transaction.description,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _getDateTimeText() {
    return Text(
      DateUtil.formatDefaultDate(_transaction.dateTime),
      style: TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 3,
      child: ListTile(
        contentPadding: EdgeInsets.all(5),
        leading: Container(
          child: CircleAvatar(
              radius: 60,
              child: Container(
                alignment: Alignment.center,
                width: 50,
                child: _getAmountText(context),
              )),
        ),
        title: _getDescriptionText(),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: (){ _deleteTransactionHandler(_transaction); },
        ),
        subtitle: _getDateTimeText(),
      ),
    );
  }
}
