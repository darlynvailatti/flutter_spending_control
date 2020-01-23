
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spending_control/model/transaction.dart';

class TransactionForm extends StatefulWidget {

  final Function _confirmTransactionHandler;

  TransactionForm(this._confirmTransactionHandler);

  @override
  State<StatefulWidget> createState() {
    return _TransactionFormState(_confirmTransactionHandler);
  }

}

class _TransactionFormState extends State<TransactionForm>{

  Function _transactionAddHandler;
  Transaction _transaction;

  TextEditingController _amountController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  _TransactionFormState(this._transactionAddHandler);

  void _addTransaction(){
    setState(() {
      _transaction.amount = double.parse(_amountController.text);
      _transaction.description = _descriptionController.text;
      _transactionAddHandler(_transaction);
    });
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    _transaction = Transaction(0, "", DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
                labelText: "Description"
            ),
          ),
          TextField(
            controller: _amountController,
            decoration: InputDecoration(
                labelText: "Amount",
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          FlatButton(
            child: Text("Add"),
            onPressed: () => _addTransaction(),
            textColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
