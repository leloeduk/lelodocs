import 'package:intl/intl.dart';

class Formatters {
  static String currency(num amount, {String symbol = "FCFA"}) {
    final formatter = NumberFormat.currency(locale: "fr_FR", symbol: symbol);
    return formatter.format(amount);
  }

  static String date(DateTime date) {
    final formatter = DateFormat("dd/MM/yyyy");
    return formatter.format(date);
  }
}
