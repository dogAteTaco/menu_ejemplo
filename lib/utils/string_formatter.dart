import 'package:intl/intl.dart';

String formatAsCurrency(double amount) {
  // Formatea el número como moneda en el formato de Estados Unidos
  return NumberFormat.currency(locale: "en_US",symbol: "\$").format(amount);
}