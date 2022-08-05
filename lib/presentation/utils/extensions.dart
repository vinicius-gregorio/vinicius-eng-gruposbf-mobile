import 'package:intl/intl.dart';

extension DoubleUtils on double {
  String formatToBrl() {
    return NumberFormat.currency(decimalDigits: 2, locale: 'pt_BR', symbol: r'R$').format(this);
  }
}
