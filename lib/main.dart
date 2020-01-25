import 'dart:ffi';

import 'package:flutter/material.dart';
import './model/transaction.dart';
import './widget/transaction_form.dart';
import './widget/transactions.dart';
import './widget/transactions_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Control',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      home: MyHomePage(title: 'Expenses Control'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _transactions = [];

  void buildDefaultTransactions() {
    Transaction t1 = Transaction(20.34, "New Shoes", DateTime.now());
//    Transaction t2 = Transaction(1322.45, "Grocery store", DateTime.now());

   //_transactions.addAll([t1]);
  }

  void _addNewTransaction(Transaction transaction) {
    setState(() {
      _transactions.add(transaction);
    });
  }

  void _startAddNewTransaction(BuildContext context){
    showModalBottomSheet(context: context, builder: (_) {
      return TransactionForm(_addNewTransaction);
    });
  }

  @override
  void initState() {
    buildDefaultTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){ _startAddNewTransaction(context); },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: TransactionsChart(_transactions),
                width: double.infinity,
                ),
            ],
          ),
          Transactions(_transactions),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){ _startAddNewTransaction(context); },
      ),
    );
  }
}
