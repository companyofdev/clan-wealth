import 'package:intl/intl.dart';

final NumberFormat _numberFormat = NumberFormat('#,###.0#', 'en_US');
final NumberFormat _numberFormatPercent = NumberFormat.percentPattern('en_US');

changedBalanceText(double currentBalance, double lastMonthBalance,
    {String noChangeText}) {
  final changedBalance = currentBalance - lastMonthBalance;
  final prefixSign = changedBalance > 0 ? '+' : '';
  final String changePercent = lastMonthBalance > 0
      ? '${_numberFormatPercent.format(changedBalance / lastMonthBalance)}'
      : '';
  String changedBalanceText = changedBalance == 0
      ? noChangeText ?? ''
      : '$prefixSign${_numberFormat.format(changedBalance)}';
  changedBalanceText += (changedBalance == currentBalance || changedBalance == 0
      ? ''
      : ' ($prefixSign$changePercent)');
  return changedBalanceText;
}
