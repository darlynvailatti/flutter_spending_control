import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spending_control/model/transaction.dart';
import 'package:flutter_spending_control/model/transaction_amount_controller.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _transactions;

  Chart(this._transactions);

  @override
  Widget build(BuildContext context) {
    TransactionAmountController transactionAmountController =
        TransactionAmountController(_transactions);

    List<Widget> getBars() {
      List<Widget> bars = [];
      transactionAmountController.transactionsPerDay.forEach((txDay) {
        bars.add(
          Column(
            children: [
              SizedBox(height: 5,),
              Text("${txDay.percentAmountOfTotal.toStringAsFixed(0)}%", style: TextStyle(
                fontSize: 11,
              ),),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.all(1),
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                height: 100,
                width: 30,
                child: Card(
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: (txDay.percentAmountOfTotal / 100) * 95,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 3,
                            style: BorderStyle.solid,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Text(txDay.dayName.substring(0,1)),
              SizedBox(height: 10,),
            ],
          ),
        );
      });
      return bars;
    }

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: getBars(),
      ),
    );
  }
}
