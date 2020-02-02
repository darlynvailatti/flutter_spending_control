import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/transaction.dart';
import '../util/date_util.dart';

class TransactionForm extends StatefulWidget {
  final Function addTransactionHandler;

  TransactionForm(this.addTransactionHandler);

  @override
  State<StatefulWidget> createState() {
    return _TransactionFormState();
  }
}

class _TransactionFormState extends State<TransactionForm> {
  Transaction _transaction;

  TextEditingController _amountController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dateTimeController = TextEditingController();

  void _addTransaction() {
    setState(() {
      _transaction.amount = double.parse(_amountController.text);
      _transaction.description = _descriptionController.text;
      widget.addTransactionHandler(_transaction);
      Navigator.of(context).pop();
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _transaction.dateTime,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _transaction.dateTime)
      setState(() {
        _transaction.dateTime = picked;
        _dateTimeController.text =
            DateUtil.formatDefaultDate(_transaction.dateTime);
      });
  }

  @override
  void initState() {
    _transaction = Transaction(
        DateTime.now().millisecondsSinceEpoch, 0, "", DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: _dateTimeController,
              decoration: InputDecoration(
                labelText: "When",
              ),
              onTap: () {
                _selectDate(context);
              },
              keyboardType: TextInputType.datetime,
            ),
            FlatButton(
              child: Text("Add"),
              onPressed: () => _addTransaction(),
              textColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
