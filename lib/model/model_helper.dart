import 'package:cloud_firestore/cloud_firestore.dart';

class ModelHelper {
  static DateTime dateTimeAsIs(DateTime dateTime) => dateTime;

  static DateTime dateTimeFromTimestamp(Timestamp timestamp) {
    if (timestamp == null) {
      return null;
    }
    return DateTime.parse(timestamp.toDate().toString());
  }
}
