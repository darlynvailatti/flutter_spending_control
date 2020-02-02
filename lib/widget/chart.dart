import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/transaction_amount_controller.dart';

class Chart extends StatelessWidget {
  final TransactionAmountController _transactionAmountController;

  Chart(this._transactionAmountController);

  List<Widget> _getBars(BuildContext context) {
    List<Widget> bars = [];

    if (_transactionAmountController.transactionsPerDay.isEmpty) return bars;

    _transactionAmountController.transactionsPerDay.forEach((txDay) {
      bars.add(LayoutBuilder(
        builder: (context, constraints) {
          double maxHeightAvailable = constraints.maxHeight;
          double heightOfSpaceBox = maxHeightAvailable * 0.05;
          double heightOfPercentLabel = maxHeightAvailable * 0.08;
          double heightOfOutsideBar = maxHeightAvailable * 0.64;
          double heightOfBar = (txDay.percentAmountOfTotal == 0
              ? 0
              : (txDay.percentAmountOfTotal / 100) * heightOfOutsideBar);
          heightOfBar = heightOfBar - (heightOfBar * 0.025);

          print(
              "maxHeightAvailable: $maxHeightAvailable | heightOfOutsideBar: $heightOfOutsideBar | heightOfBar: $heightOfBar ");

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 1),
            child: Column(
              children: [
                SizedBox(
                  height: heightOfSpaceBox,
                ),
                Container(
                  height: heightOfPercentLabel,
                  child: FittedBox(
                    child: Text(
                      "${txDay.percentAmountOfTotal.toStringAsFixed(0)}%",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: heightOfSpaceBox,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  height: heightOfOutsideBar,
                  width: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      txDay.percentAmountOfTotal == 0
                          ? SizedBox()
                          : Container(
                              height: heightOfBar,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                color: Theme.of(context).primaryColor,
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
                SizedBox(
                  height: heightOfSpaceBox,
                ),
                Container(
                  height: heightOfPercentLabel,
                  child: FittedBox(child: Text(txDay.dayName.substring(0, 2))),
                ),
                SizedBox(
                  height: heightOfSpaceBox,
                ),
              ],
            ),
          );
        },
      ));
    });
    return bars;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _getBars(context),
      ),
    );
  }
}
