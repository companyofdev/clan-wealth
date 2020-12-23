import 'package:clan_wealth/persistent/wealth_dao.dart';
import 'package:clan_wealth/persistent/wealth_historical_amount_dao.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';

// assuming that your file is called filename.dart. This will give an error at first,
// but it's needed for moor to know about the generated code
part 'wealth.g.dart';

final _uuid = Uuid();

class Wealths extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get title => text().withLength(min: 1, max: 50)();
  TextColumn get description => text().nullable()();
  RealColumn get amount => real()();
  DateTimeColumn get updatedDate => dateTime()();
  IntColumn get iconCode => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class WealthHistoricalAmounts extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get wealthId => text()();
  RealColumn get amount => real()();
  DateTimeColumn get updatedDate => dateTime()();
}

@UseMoor(
  tables: [Wealths, WealthHistoricalAmounts],
  daos: [WealthDao, WealthHistoricalAmountDao],
)
class WealthDatabase extends _$WealthDatabase {
  WealthDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
            path: 'wealth.db.sqlite',
            logStatements: true,
          ),
        );

  @override
  int get schemaVersion => 1;
}
