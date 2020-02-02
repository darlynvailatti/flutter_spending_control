import 'package:flutter/cupertino.dart';

class NoTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
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
              height: constraints.maxHeight * 0.2,
              width: 100,
            ),
          ],
        ),
      );
    });
  }
}
