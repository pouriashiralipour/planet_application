import 'package:intl/intl.dart';

String priceFormatter(String price) {
  final number = int.parse(price);
  final formatter = NumberFormat('#,###');
  return formatter.format(number);
}
