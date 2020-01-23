import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spending_control/model/transaction.dart';
import 'package:flutter_spending_control/util/date_util.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction _transaction;
  final double _amountContainerWith = 140;

  TransactionCard(this._transaction);

  Text _getAmountText(BuildContext context){
    return Text(
      '\$${_transaction.amount.toStringAsFixed(2)}',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Text _getDescriptionText(){
    return Text(
      _transaction.description,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _getDateTimeText(){
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
      child: Row(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                _getAmountText(context)
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: _amountContainerWith,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 3,
                style: BorderStyle.solid,
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                _getDescriptionText(),
                _getDateTimeText(),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
          ),
        ],
      ),
    );
  }
}
