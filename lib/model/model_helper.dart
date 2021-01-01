import 'package:clan_wealth/model/wealth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jiffy/jiffy.dart';

class ModelHelper {
  static DateTime dateTimeAsIs(DateTime dateTime) => dateTime;

  static DateTime dateTimeFromTimestamp(Timestamp timestamp) {
    if (timestamp == null) {
      return null;
    }
    return DateTime.parse(timestamp.toDate().toString());
  }

  static getPreviousMonthBalance(Wealth wealth) {
    final previousBalance = wealth.previousBalances?.first;
    double previousBalanceNumber = previousBalance?.balance ?? 0.0;
    final previousBalanceDate = previousBalance?.updatedDate;
    final lastMonth = (Jiffy()..subtract(months: 1)).month;
    if (previousBalanceDate == null || previousBalanceDate.month != lastMonth) {
      previousBalanceNumber = 0.0;
    }

    return previousBalanceNumber;
  }
}
