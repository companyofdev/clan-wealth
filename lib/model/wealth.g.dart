// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wealth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wealth _$WealthFromJson(Map<String, dynamic> json) {
  return Wealth(
    id: json['id'] as String,
    ownerId: json['ownerId'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    category: json['category'] as String,
    updatedDate:
        Wealth._dateTimeFromTimestamp(json['updatedDate'] as Timestamp),
    monthlyBalance: (json['monthlyBalance'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Balance.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$WealthToJson(Wealth instance) => <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'updatedDate': Wealth._dateTimeAsIs(instance.updatedDate),
      'monthlyBalance': instance.monthlyBalance,
    };

MonthlyBalance _$MonthlyBalanceFromJson(Map<String, dynamic> json) {
  return MonthlyBalance(
    month: json['month'] as String,
    balance: json['balance'] == null
        ? null
        : Balance.fromJson(json['balance'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MonthlyBalanceToJson(MonthlyBalance instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('month', instance.month);
  writeNotNull('balance', instance.balance);
  return val;
}

Balance _$BalanceFromJson(Map<String, dynamic> json) {
  return Balance(
    balance: (json['balance'] as num)?.toDouble(),
    estimateBalance: (json['estimateBalance'] as num)?.toDouble(),
    boughtPrice: (json['boughtPrice'] as num)?.toDouble(),
    boughtFee: (json['boughtFee'] as num)?.toDouble(),
    maintainingFee: (json['maintainingFee'] as num)?.toDouble(),
    upgradingFee: (json['upgradingFee'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$BalanceToJson(Balance instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('balance', instance.balance);
  writeNotNull('estimateBalance', instance.estimateBalance);
  writeNotNull('boughtPrice', instance.boughtPrice);
  writeNotNull('boughtFee', instance.boughtFee);
  writeNotNull('maintainingFee', instance.maintainingFee);
  writeNotNull('upgradingFee', instance.upgradingFee);
  return val;
}
