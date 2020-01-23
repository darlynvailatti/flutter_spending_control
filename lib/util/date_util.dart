
import 'package:intl/intl.dart';

class DateUtil {

  static String formatDefaultDate(DateTime dateTime){
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);
  }

}