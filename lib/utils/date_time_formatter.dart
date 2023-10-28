import 'package:intl/intl.dart';

class DateTimeFormatter {
  static showDateFormat1(String date) {
    String tempDate = DateFormat.MMMMd().format(DateTime.parse(date));
    return tempDate;
  }

  static showDateFormat2(DateTime date) {
    final DateFormat formatter = DateFormat('MM / dd / yyyy');
    final String formatted = formatter.format(date);
    return formatted;
  }

  static showDateFormat3(DateTime date) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    final String formatted = formatter.format(date);
    return formatted;
  }

  static dateToTimeStamp(DateTime date) {
    final int dateFormat = date.millisecondsSinceEpoch;
    return dateFormat;
  }

  static timeStampToDate(int date) {
    final DateTime dateFormat = DateTime.fromMicrosecondsSinceEpoch(date * 1000);
    final DateFormat formatter = DateFormat('MM / dd / yyyy');
    final String formatted = formatter.format(dateFormat);
    return formatted;
  }

  static showTime(String dateTime) {
    String tempDate = DateFormat().add_jm().format(DateTime.parse(dateTime));
    return tempDate;
  }
}
