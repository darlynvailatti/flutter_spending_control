
import 'dart:ffi';

import 'package:flutter/foundation.dart';

class Transaction {

  double amount;
  String description;
  DateTime dateTime;

  Transaction(
      this.amount,
      this.description,
      this.dateTime
      );

}