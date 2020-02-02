
import 'dart:ffi';

import 'package:flutter/foundation.dart';

class Transaction {

  int id;
  double amount;
  String description;
  DateTime dateTime;

  Transaction(
      this.id,
      this.amount,
      this.description,
      this.dateTime
      );

}