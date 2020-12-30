import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wealth.g.dart';

@JsonSerializable()
class Wealth {
  final String id;
  final String ownerId;
  final String title;
  final String description;
  final String category;

  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeAsIs)
  final DateTime updatedDate;
  final Map<String, Balance> monthlyBalance;

  Wealth({
    @required this.id,
    @required this.ownerId,
    @required this.title,
    this.description,
    @required this.category,
    @required this.updatedDate,
    this.monthlyBalance,
  });

  factory Wealth.fromJson(Map<String, dynamic> json) => _$WealthFromJson(json);
  Map<String, dynamic> toJson() => _$WealthToJson(this);

  static DateTime _dateTimeAsIs(DateTime dateTime) => dateTime;

  static DateTime _dateTimeFromTimestamp(Timestamp timestamp) {
    return DateTime.parse(timestamp.toDate().toString());
  }
}

@JsonSerializable(includeIfNull: false)
class MonthlyBalance {
  final String month;
  final Balance balance;

  MonthlyBalance({this.month, this.balance});

  factory MonthlyBalance.fromJson(Map<String, dynamic> json) =>
      _$MonthlyBalanceFromJson(json);
  Map<String, dynamic> toJson() => _$MonthlyBalanceToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Balance {
  final double balance;
  final double estimateBalance;
  final double boughtPrice;
  final double boughtFee;
  final double maintainingFee;
  final double upgradingFee;

  const Balance({
    @required this.balance,
    this.estimateBalance,
    this.boughtPrice,
    this.boughtFee,
    this.maintainingFee,
    this.upgradingFee,
  });

  factory Balance.fromJson(Map<String, dynamic> json) =>
      _$BalanceFromJson(json);
  Map<String, dynamic> toJson() => _$BalanceToJson(this);
}
