
import 'package:flutter/cupertino.dart';

class NoTransactions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text("No expenses yet!"),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Image.asset(
              "assets/images/sleep.png",
            ),
            height: 100,
            width: 100,
          ),
        ],
      ),
    );
  }

}