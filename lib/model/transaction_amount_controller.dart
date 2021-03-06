
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

    double totalAmount = 0;
    if(_transactions.isNotEmpty){
      totalAmount = _transactions.map((transaction) => transaction.amount)
          .reduce((sum, element) => sum + element);
    }

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


      List<Transaction> transactionsOfDay = [];
      if(_transactions.isNotEmpty){
        transactionsOfDay = _transactions.where((t) => t.dateTime.day == day.day).toList();
      }

      double totalAmountOfDay = 0;
      if(transactionsOfDay.isNotEmpty) {
        totalAmountOfDay = transactionsOfDay.map((t) => t.amount).reduce((a, b) => a + b);
      }
      transactionAmountDaily = TransactionAmountDaily(
          dayNumber: day.day,
          dayName: dayOfWeek,
          totalOfPeriod: totalAmount,
          amount: totalAmountOfDay
      );

      _transactionsPerDay.add(transactionAmountDaily);
    }
  }

  List<TransactionAmountDaily> get transactionsPerDay => _transactionsPerDay;
}