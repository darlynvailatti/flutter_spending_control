import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spending_control/model/transaction.dart';
import 'package:flutter_spending_control/model/transaction_amount_controller.dart';

class Chart extends StatelessWidget {

  final TransactionAmountController _transactionAmountController;

  Chart(this._transactionAmountController);

  List<Widget> _getBars(BuildContext context) {
    List<Widget> bars = [];

    if(_transactionAmountController.transactionsPerDay.isEmpty)
      return bars;

    _transactionAmountController.transactionsPerDay.forEach((txDay) {
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
                      height: txDay.percentAmountOfTotal == 0 ? 0 : (txDay.percentAmountOfTotal / 100) * 90,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 0,
                          style: BorderStyle.solid,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text(txDay.dayName.substring(0,2)),
            SizedBox(height: 10,),
          ],
        ),
      );
    });
    return bars;
  }

  @override
  Widget build(BuildContext context) {
    return
      Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _getBars(context),
      ),
    );
  }
}
