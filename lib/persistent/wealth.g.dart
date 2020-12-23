// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wealth.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Wealth extends DataClass implements Insertable<Wealth> {
  final String id;
  final String title;
  final String description;
  final int iconCode;
  Wealth(
      {@required this.id,
      @required this.title,
      this.description,
      this.iconCode});
  factory Wealth.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Wealth(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      iconCode:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}icon_code']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || iconCode != null) {
      map['icon_code'] = Variable<int>(iconCode);
    }
    return map;
  }

  WealthsCompanion toCompanion(bool nullToAbsent) {
    return WealthsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      iconCode: iconCode == null && nullToAbsent
          ? const Value.absent()
          : Value(iconCode),
    );
  }

  factory Wealth.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Wealth(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      iconCode: serializer.fromJson<int>(json['iconCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'iconCode': serializer.toJson<int>(iconCode),
    };
  }

  Wealth copyWith(
          {String id, String title, String description, int iconCode}) =>
      Wealth(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        iconCode: iconCode ?? this.iconCode,
      );
  @override
  String toString() {
    return (StringBuffer('Wealth(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('iconCode: $iconCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(title.hashCode, $mrjc(description.hashCode, iconCode.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Wealth &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.iconCode == this.iconCode);
}

class WealthsCompanion extends UpdateCompanion<Wealth> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<int> iconCode;
  const WealthsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.iconCode = const Value.absent(),
  });
  WealthsCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    this.description = const Value.absent(),
    this.iconCode = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Wealth> custom({
    Expression<String> id,
    Expression<String> title,
    Expression<String> description,
    Expression<int> iconCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (iconCode != null) 'icon_code': iconCode,
    });
  }

  WealthsCompanion copyWith(
      {Value<String> id,
      Value<String> title,
      Value<String> description,
      Value<int> iconCode}) {
    return WealthsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      iconCode: iconCode ?? this.iconCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (iconCode.present) {
      map['icon_code'] = Variable<int>(iconCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WealthsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('iconCode: $iconCode')
          ..write(')'))
        .toString();
  }
}

class $WealthsTable extends Wealths with TableInfo<$WealthsTable, Wealth> {
  final GeneratedDatabase _db;
  final String _alias;
  $WealthsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    )..clientDefault = () => _uuid.v4();
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _iconCodeMeta = const VerificationMeta('iconCode');
  GeneratedIntColumn _iconCode;
  @override
  GeneratedIntColumn get iconCode => _iconCode ??= _constructIconCode();
  GeneratedIntColumn _constructIconCode() {
    return GeneratedIntColumn(
      'icon_code',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, description, iconCode];
  @override
  $WealthsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'wealths';
  @override
  final String actualTableName = 'wealths';
  @override
  VerificationContext validateIntegrity(Insertable<Wealth> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('icon_code')) {
      context.handle(_iconCodeMeta,
          iconCode.isAcceptableOrUnknown(data['icon_code'], _iconCodeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Wealth map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Wealth.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WealthsTable createAlias(String alias) {
    return $WealthsTable(_db, alias);
  }
}

class WealthValue extends DataClass implements Insertable<WealthValue> {
  final String id;
  final String wealthId;
  final double amount;
  final DateTime updatedDate;
  WealthValue(
      {@required this.id,
      @required this.wealthId,
      this.amount,
      @required this.updatedDate});
  factory WealthValue.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return WealthValue(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      wealthId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}wealth_id']),
      amount:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || wealthId != null) {
      map['wealth_id'] = Variable<String>(wealthId);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
    }
    return map;
  }

  WealthValuesCompanion toCompanion(bool nullToAbsent) {
    return WealthValuesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      wealthId: wealthId == null && nullToAbsent
          ? const Value.absent()
          : Value(wealthId),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
    );
  }

  factory WealthValue.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WealthValue(
      id: serializer.fromJson<String>(json['id']),
      wealthId: serializer.fromJson<String>(json['wealthId']),
      amount: serializer.fromJson<double>(json['amount']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'wealthId': serializer.toJson<String>(wealthId),
      'amount': serializer.toJson<double>(amount),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
    };
  }

  WealthValue copyWith(
          {String id, String wealthId, double amount, DateTime updatedDate}) =>
      WealthValue(
        id: id ?? this.id,
        wealthId: wealthId ?? this.wealthId,
        amount: amount ?? this.amount,
        updatedDate: updatedDate ?? this.updatedDate,
      );
  @override
  String toString() {
    return (StringBuffer('WealthValue(')
          ..write('id: $id, ')
          ..write('wealthId: $wealthId, ')
          ..write('amount: $amount, ')
          ..write('updatedDate: $updatedDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(wealthId.hashCode, $mrjc(amount.hashCode, updatedDate.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is WealthValue &&
          other.id == this.id &&
          other.wealthId == this.wealthId &&
          other.amount == this.amount &&
          other.updatedDate == this.updatedDate);
}

class WealthValuesCompanion extends UpdateCompanion<WealthValue> {
  final Value<String> id;
  final Value<String> wealthId;
  final Value<double> amount;
  final Value<DateTime> updatedDate;
  const WealthValuesCompanion({
    this.id = const Value.absent(),
    this.wealthId = const Value.absent(),
    this.amount = const Value.absent(),
    this.updatedDate = const Value.absent(),
  });
  WealthValuesCompanion.insert({
    this.id = const Value.absent(),
    @required String wealthId,
    this.amount = const Value.absent(),
    @required DateTime updatedDate,
  })  : wealthId = Value(wealthId),
        updatedDate = Value(updatedDate);
  static Insertable<WealthValue> custom({
    Expression<String> id,
    Expression<String> wealthId,
    Expression<double> amount,
    Expression<DateTime> updatedDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (wealthId != null) 'wealth_id': wealthId,
      if (amount != null) 'amount': amount,
      if (updatedDate != null) 'updated_date': updatedDate,
    });
  }

  WealthValuesCompanion copyWith(
      {Value<String> id,
      Value<String> wealthId,
      Value<double> amount,
      Value<DateTime> updatedDate}) {
    return WealthValuesCompanion(
      id: id ?? this.id,
      wealthId: wealthId ?? this.wealthId,
      amount: amount ?? this.amount,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (wealthId.present) {
      map['wealth_id'] = Variable<String>(wealthId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WealthValuesCompanion(')
          ..write('id: $id, ')
          ..write('wealthId: $wealthId, ')
          ..write('amount: $amount, ')
          ..write('updatedDate: $updatedDate')
          ..write(')'))
        .toString();
  }
}

class $WealthValuesTable extends WealthValues
    with TableInfo<$WealthValuesTable, WealthValue> {
  final GeneratedDatabase _db;
  final String _alias;
  $WealthValuesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    )..clientDefault = () => _uuid.v4();
  }

  final VerificationMeta _wealthIdMeta = const VerificationMeta('wealthId');
  GeneratedTextColumn _wealthId;
  @override
  GeneratedTextColumn get wealthId => _wealthId ??= _constructWealthId();
  GeneratedTextColumn _constructWealthId() {
    return GeneratedTextColumn(
      'wealth_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedRealColumn _amount;
  @override
  GeneratedRealColumn get amount => _amount ??= _constructAmount();
  GeneratedRealColumn _constructAmount() {
    return GeneratedRealColumn(
      'amount',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  GeneratedDateTimeColumn _updatedDate;
  @override
  GeneratedDateTimeColumn get updatedDate =>
      _updatedDate ??= _constructUpdatedDate();
  GeneratedDateTimeColumn _constructUpdatedDate() {
    return GeneratedDateTimeColumn(
      'updated_date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, wealthId, amount, updatedDate];
  @override
  $WealthValuesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'wealth_values';
  @override
  final String actualTableName = 'wealth_values';
  @override
  VerificationContext validateIntegrity(Insertable<WealthValue> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('wealth_id')) {
      context.handle(_wealthIdMeta,
          wealthId.isAcceptableOrUnknown(data['wealth_id'], _wealthIdMeta));
    } else if (isInserting) {
      context.missing(_wealthIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    } else if (isInserting) {
      context.missing(_updatedDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  WealthValue map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return WealthValue.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WealthValuesTable createAlias(String alias) {
    return $WealthValuesTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $WealthsTable _wealths;
  $WealthsTable get wealths => _wealths ??= $WealthsTable(this);
  $WealthValuesTable _wealthValues;
  $WealthValuesTable get wealthValues =>
      _wealthValues ??= $WealthValuesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [wealths, wealthValues];
}
