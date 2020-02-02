import 'package:flutter/material.dart';
import 'package:flutter_spending_control/model/transaction.dart';
import './widget/transaction_form.dart';
import './widget/transactions_list_view.dart';
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
        errorColor: Colors.red,
      ),
      home: MyHomePage(title: "Personal Expenses"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transactions;
  bool _showChart = false;

  void _startAddNewTransaction(BuildContext context) {
    setState(() {
      showModalBottomSheet(
          context: context,
          builder: (_) {
            return TransactionForm(addTransaction);
          });
    });
  }

  void addTransaction(Transaction transaction) {
    setState(() {
      transactions.add(transaction);
    });
  }

  void deleteTransaction(Transaction transaction) {
    setState(() {
      transactions.removeWhere((t) => t.id == transaction.id);
    });
  }

  @override
  void initState() {
    transactions = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    var appBar = AppBar(
      title: Text(widget.title),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            _startAddNewTransaction(context);
          },
        ),
      ],
    );

    var preferredSizeAppBar = appBar.preferredSize;
    Size size = MediaQuery.of(context).size;
    var widthSize = size.width;
    var heightSize = size.height;
    var paddingOfDevice = MediaQuery.of(context).padding;
    var topPaddingOfDevice = paddingOfDevice.top;

    var availableHeightSize =
        heightSize - topPaddingOfDevice - preferredSizeAppBar.height;

    double percentOfChartSize = isLandscape ? 0.7 : 0.3;

    var containerChartWidget = Container(
      child: TransactionsChart(transactions),
      width: MediaQuery.of(context).size.width,
      height: availableHeightSize * percentOfChartSize,
    );

    var switchButtonWidget =  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Show chart?"),
        Switch(
          value: _showChart,
          onChanged: (val) {
            setState(() {
              _showChart = val;
            });
          },
        )
      ],
    );

    var expandedTransactionsWidget =
      Expanded(
        child: TransactionsListView(transactions, deleteTransaction),
      );

    List<Widget> contextWidgetsView = [];

    if(isLandscape) {
      _showChart ?
        contextWidgetsView.addAll([
          switchButtonWidget,
          containerChartWidget
        ]) :
        contextWidgetsView.addAll([
          switchButtonWidget,
          expandedTransactionsWidget
        ]);
    }

    if(!isLandscape)
      contextWidgetsView.addAll(
        [containerChartWidget, expandedTransactionsWidget]
      );

    return Scaffold(
      appBar: appBar,
      body: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.down,
        children: contextWidgetsView,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransaction(context);
        },
      ),
    );
  }
}
