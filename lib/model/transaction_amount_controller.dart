
import 'package:flutter_spending_control/model/transaction.dart';
import 'package:flutter_spending_control/model/transaction_amount_daily.dart';

class TransactionAmountController {

  final List<Transaction> _transactions;
  List<TransactionAmountDaily> _transactionsPerDay;

  TransactionAmountController(this._transactions) {
    _processTransactionsByWeek();
  }

  void _processTransactionsByWeek(){

    if(_transactions.isNotEmpty) {
      var totalAmount = _transactions.map((transaction) => transaction.amount)
          .reduce((sum, element) => sum + element);
    }

    List<String> daysOfWeek = [
      "Monday", "Thuesday", "Wendesday",
      "Thursday", "Friday", "Saturday",
      "Sunday",
    ];

    _transactionsPerDay = [];
    for(int i=0;i<7;i++){
      var transactionAmountDaily = TransactionAmountDaily(
        dayNumber: i+1,
        dayName: daysOfWeek[i],
        amount: (10 * i).toDouble(),
        totalOfWeek: 100,
      );
      _transactionsPerDay.add(transactionAmountDaily);
    }
  }

  List<TransactionAmountDaily> get transactionsPerDay => _transactionsPerDay;
}