import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Wealth {
  final String id;
  final String ownerId;
  final String title;
  final String description;
  final String category;
  final Timestamp updatedDate;
  final Aggregate aggregate;

  Wealth({
    @required this.id,
    @required this.ownerId,
    @required this.title,
    this.description,
    @required this.category,
    @required this.updatedDate,
    this.aggregate,
  });

  factory Wealth.fromJson(Map<String, dynamic> json) {
    return Wealth(
      id: json['id'],
      ownerId: json['ownerId'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      updatedDate: json['updatedDate'],
      aggregate: Aggregate.fromJson(json['aggregate']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ownerId': ownerId,
      'title': title,
      'description': description,
      'category': category,
      'updatedDate': updatedDate,
      'aggregate': aggregate.toMap(),
    };
  }
}

class Aggregate {
  final double balance;
  final double estimateBalance;
  final double boughtPrice;
  final double boughtFee;
  final double maintainingFee;
  final double upgradingFee;

  const Aggregate({
    @required this.balance,
    this.estimateBalance,
    this.boughtPrice,
    this.boughtFee,
    this.maintainingFee,
    this.upgradingFee,
  });

  Map<String, dynamic> toMap() {
    return {
      'balance': balance,
      'estimateBalance': estimateBalance,
      'boughtPrice': boughtPrice,
      'boughtFee': boughtFee,
      'maintainingFee': maintainingFee,
      'upgradingFee': upgradingFee,
    };
  }

  factory Aggregate.fromJson(Map<String, dynamic> json) {
    return Aggregate(
      balance: json['balance'],
      estimateBalance: json['estimateBalance'],
      boughtPrice: json['boughtPrice'],
      boughtFee: json['boughtFee'],
      maintainingFee: json['maintainingFee'],
      upgradingFee: json['upgradingFee'],
    );
  }
}
