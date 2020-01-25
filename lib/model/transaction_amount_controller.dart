
import './transaction.dart';
import './transaction_amount_daily.dart';
import 'package:intl/intl.dart';

class TransactionAmountController {

  final List<Transaction> _transactions;
  List<TransactionAmountDaily> _transactionsPerDay;

  TransactionAmountController(this._transactions) {
    _processTransactionsByWeek();
  }

  void _processTransactionsByWeek(){

    _transactionsPerDay = [];

    if(_transactions.isEmpty){
      print("No transactions to amount");
      return;
    }

    double totalAmount = 0;
    totalAmount = _transactions.map((transaction) => transaction.amount)
        .reduce((sum, element) => sum + element);

    var today = new DateTime.now();
    var sixDaysInPastFromToday = today.subtract(new Duration(days: 6));

    DateTime dayIndex = sixDaysInPastFromToday;
    for(int i=0;i<7;i++){

      DateTime day = DateTime.fromMillisecondsSinceEpoch(dayIndex.millisecondsSinceEpoch);
      dayIndex = dayIndex.add(Duration(days: 1));

      var dayOfWeek = DateFormat('EEEE').format(day);
      TransactionAmountDaily transactionAmountDaily = TransactionAmountDaily(
          dayName: dayOfWeek,
      );

      var transactionsOfDay = _transactions.where((t) => t.dateTime.day == day.day).toList();

      if(transactionsOfDay.isNotEmpty){
        var totalAmountOfDay = transactionsOfDay.map((t) => t.amount).reduce((a,
            b) => a + b);
        transactionAmountDaily = TransactionAmountDaily(
            dayNumber: day.day,
            dayName: dayOfWeek,
            totalOfPeriod: totalAmount,
            amount: totalAmountOfDay
        );
      }
      _transactionsPerDay.add(transactionAmountDaily);
    }
  }

  List<TransactionAmountDaily> get transactionsPerDay => _transactionsPerDay;
}