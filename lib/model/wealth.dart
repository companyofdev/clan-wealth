import 'package:clan_wealth/model/model_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wealth.g.dart';

@JsonSerializable()
class Wealth {
  final String id;
  final String title;
  final String description;
  final String category;
  final List<Holder> holderDetails;
  final List<String> uids;

  @JsonKey(
      fromJson: ModelHelper.dateTimeFromTimestamp,
      toJson: ModelHelper.dateTimeAsIs)
  final DateTime updatedDate;
  final Balance currentBalance;
  final List<Balance> previousBalances;

  Wealth({
    @required this.id,
    @required this.title,
    this.description,
    @required this.category,
    @required this.updatedDate,
    @required this.currentBalance,
    this.previousBalances,
    this.holderDetails,
    this.uids,
  });

  factory Wealth.fromJson(Map<String, dynamic> json) => _$WealthFromJson(json);
  Map<String, dynamic> toJson() => _$WealthToJson(this);
}

enum HolderRole { Owner, Editor, Viewer }

@JsonSerializable()
class Holder {
  final String uid;
  final String displayName;
  final String photoURL;
  final HolderRole role;
  final double sharePercent;

  Holder({
    @required this.uid,
    this.displayName,
    this.photoURL,
    @required this.role,
    this.sharePercent,
  });

  factory Holder.fromJson(Map<String, dynamic> json) => _$HolderFromJson(json);
  Map<String, dynamic> toJson() => _$HolderToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Balance {
  final double balance;
  final double estimateBalance;
  final double boughtPrice;
  final double boughtFee;
  final double maintainingFee;
  final double upgradingFee;
  @JsonKey(
      fromJson: ModelHelper.dateTimeFromTimestamp,
      toJson: ModelHelper.dateTimeAsIs)
  final DateTime updatedDate;
  final String uid;

  const Balance({
    @required this.balance,
    this.estimateBalance,
    this.boughtPrice,
    this.boughtFee,
    this.maintainingFee,
    this.upgradingFee,
    this.updatedDate,
    this.uid,
  });

  factory Balance.fromJson(Map<String, dynamic> json) =>
      _$BalanceFromJson(json);
  Map<String, dynamic> toJson() => _$BalanceToJson(this);
}
