// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wealth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wealth _$WealthFromJson(Map<String, dynamic> json) {
  return Wealth(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    category: json['category'] as String,
    updatedDate:
        Wealth._dateTimeFromTimestamp(json['updatedDate'] as Timestamp),
    monthlyBalance: (json['monthlyBalance'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Balance.fromJson(e as Map<String, dynamic>)),
    ),
    holderDetails: (json['holderDetails'] as List)
        ?.map((e) =>
            e == null ? null : Holder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    uids: (json['uids'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$WealthToJson(Wealth instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'holderDetails': instance.holderDetails,
      'uids': instance.uids,
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

Holder _$HolderFromJson(Map<String, dynamic> json) {
  return Holder(
    uid: json['uid'] as String,
    displayName: json['displayName'] as String,
    photoURL: json['photoURL'] as String,
    role: _$enumDecodeNullable(_$HolderRoleEnumMap, json['role']),
    sharePercent: (json['sharePercent'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$HolderToJson(Holder instance) => <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'role': _$HolderRoleEnumMap[instance.role],
      'sharePercent': instance.sharePercent,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$HolderRoleEnumMap = {
  HolderRole.Owner: 'Owner',
  HolderRole.Editor: 'Editor',
  HolderRole.Viewer: 'Viewer',
};

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
