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
  final double amount;
  final DateTime updatedDate;
  final int iconCode;
  Wealth(
      {@required this.id,
      @required this.title,
      this.description,
      @required this.amount,
      @required this.updatedDate,
      this.iconCode});
  factory Wealth.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final intType = db.typeSystem.forDartType<int>();
    return Wealth(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      amount:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      updatedDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_date']),
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
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    if (!nullToAbsent || updatedDate != null) {
      map['updated_date'] = Variable<DateTime>(updatedDate);
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
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      updatedDate: updatedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedDate),
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
      amount: serializer.fromJson<double>(json['amount']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
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
      'amount': serializer.toJson<double>(amount),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'iconCode': serializer.toJson<int>(iconCode),
    };
  }

  Wealth copyWith(
          {String id,
          String title,
          String description,
          double amount,
          DateTime updatedDate,
          int iconCode}) =>
      Wealth(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        amount: amount ?? this.amount,
        updatedDate: updatedDate ?? this.updatedDate,
        iconCode: iconCode ?? this.iconCode,
      );
  @override
  String toString() {
    return (StringBuffer('Wealth(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('amount: $amount, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('iconCode: $iconCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(amount.hashCode,
                  $mrjc(updatedDate.hashCode, iconCode.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Wealth &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.amount == this.amount &&
          other.updatedDate == this.updatedDate &&
          other.iconCode == this.iconCode);
}

class WealthsCompanion extends UpdateCompanion<Wealth> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<double> amount;
  final Value<DateTime> updatedDate;
  final Value<int> iconCode;
  const WealthsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.amount = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.iconCode = const Value.absent(),
  });
  WealthsCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    this.description = const Value.absent(),
    @required double amount,
    @required DateTime updatedDate,
    this.iconCode = const Value.absent(),
  })  : title = Value(title),
        amount = Value(amount),
        updatedDate = Value(updatedDate);
  static Insertable<Wealth> custom({
    Expression<String> id,
    Expression<String> title,
    Expression<String> description,
    Expression<double> amount,
    Expression<DateTime> updatedDate,
    Expression<int> iconCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (amount != null) 'amount': amount,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (iconCode != null) 'icon_code': iconCode,
    });
  }

  WealthsCompanion copyWith(
      {Value<String> id,
      Value<String> title,
      Value<String> description,
      Value<double> amount,
      Value<DateTime> updatedDate,
      Value<int> iconCode}) {
    return WealthsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      updatedDate: updatedDate ?? this.updatedDate,
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
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
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
          ..write('amount: $amount, ')
          ..write('updatedDate: $updatedDate, ')
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

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedRealColumn _amount;
  @override
  GeneratedRealColumn get amount => _amount ??= _constructAmount();
  GeneratedRealColumn _constructAmount() {
    return GeneratedRealColumn(
      'amount',
      $tableName,
      false,
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
  List<GeneratedColumn> get $columns =>
      [id, title, description, amount, updatedDate, iconCode];
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
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date'], _updatedDateMeta));
    } else if (isInserting) {
      context.missing(_updatedDateMeta);
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

class WealthHistoricalAmount extends DataClass
    implements Insertable<WealthHistoricalAmount> {
  final String id;
  final String wealthId;
  final double amount;
  final DateTime updatedDate;
  WealthHistoricalAmount(
      {@required this.id,
      @required this.wealthId,
      @required this.amount,
      @required this.updatedDate});
  factory WealthHistoricalAmount.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return WealthHistoricalAmount(
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

  WealthHistoricalAmountsCompanion toCompanion(bool nullToAbsent) {
    return WealthHistoricalAmountsCompanion(
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

  factory WealthHistoricalAmount.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WealthHistoricalAmount(
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

  WealthHistoricalAmount copyWith(
          {String id, String wealthId, double amount, DateTime updatedDate}) =>
      WealthHistoricalAmount(
        id: id ?? this.id,
        wealthId: wealthId ?? this.wealthId,
        amount: amount ?? this.amount,
        updatedDate: updatedDate ?? this.updatedDate,
      );
  @override
  String toString() {
    return (StringBuffer('WealthHistoricalAmount(')
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
      (other is WealthHistoricalAmount &&
          other.id == this.id &&
          other.wealthId == this.wealthId &&
          other.amount == this.amount &&
          other.updatedDate == this.updatedDate);
}

class WealthHistoricalAmountsCompanion
    extends UpdateCompanion<WealthHistoricalAmount> {
  final Value<String> id;
  final Value<String> wealthId;
  final Value<double> amount;
  final Value<DateTime> updatedDate;
  const WealthHistoricalAmountsCompanion({
    this.id = const Value.absent(),
    this.wealthId = const Value.absent(),
    this.amount = const Value.absent(),
    this.updatedDate = const Value.absent(),
  });
  WealthHistoricalAmountsCompanion.insert({
    this.id = const Value.absent(),
    @required String wealthId,
    @required double amount,
    @required DateTime updatedDate,
  })  : wealthId = Value(wealthId),
        amount = Value(amount),
        updatedDate = Value(updatedDate);
  static Insertable<WealthHistoricalAmount> custom({
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

  WealthHistoricalAmountsCompanion copyWith(
      {Value<String> id,
      Value<String> wealthId,
      Value<double> amount,
      Value<DateTime> updatedDate}) {
    return WealthHistoricalAmountsCompanion(
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
    return (StringBuffer('WealthHistoricalAmountsCompanion(')
          ..write('id: $id, ')
          ..write('wealthId: $wealthId, ')
          ..write('amount: $amount, ')
          ..write('updatedDate: $updatedDate')
          ..write(')'))
        .toString();
  }
}

class $WealthHistoricalAmountsTable extends WealthHistoricalAmounts
    with TableInfo<$WealthHistoricalAmountsTable, WealthHistoricalAmount> {
  final GeneratedDatabase _db;
  final String _alias;
  $WealthHistoricalAmountsTable(this._db, [this._alias]);
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
      false,
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
  $WealthHistoricalAmountsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'wealth_historical_amounts';
  @override
  final String actualTableName = 'wealth_historical_amounts';
  @override
  VerificationContext validateIntegrity(
      Insertable<WealthHistoricalAmount> instance,
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
    } else if (isInserting) {
      context.missing(_amountMeta);
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
  WealthHistoricalAmount map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return WealthHistoricalAmount.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WealthHistoricalAmountsTable createAlias(String alias) {
    return $WealthHistoricalAmountsTable(_db, alias);
  }
}

abstract class _$WealthDatabase extends GeneratedDatabase {
  _$WealthDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $WealthsTable _wealths;
  $WealthsTable get wealths => _wealths ??= $WealthsTable(this);
  $WealthHistoricalAmountsTable _wealthHistoricalAmounts;
  $WealthHistoricalAmountsTable get wealthHistoricalAmounts =>
      _wealthHistoricalAmounts ??= $WealthHistoricalAmountsTable(this);
  WealthDao _wealthDao;
  WealthDao get wealthDao => _wealthDao ??= WealthDao(this as WealthDatabase);
  WealthHistoricalAmountDao _wealthHistoricalAmountDao;
  WealthHistoricalAmountDao get wealthHistoricalAmountDao =>
      _wealthHistoricalAmountDao ??=
          WealthHistoricalAmountDao(this as WealthDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [wealths, wealthHistoricalAmounts];
}
