import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

// assuming that your file is called filename.dart. This will give an error at first,
// but it's needed for moor to know about the generated code
part 'wealth.g.dart';

final _uuid = Uuid();

class Wealths extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get title => text().withLength(min: 1, max: 50)();
  TextColumn get description => text().nullable()();
  IntColumn get iconCode => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class WealthValues extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get wealthId => text()();
  RealColumn get amount => real().nullable()();
  DateTimeColumn get updatedDate => dateTime()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'clan_wealth.db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Wealths, WealthValues])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Wealth>> get allWealthEntries => select(wealths).get();

  Future<List<WealthValue>> getAllWealthValueEntriesByWealth(Wealth wealth) {
    return (select(wealthValues)
          ..where((tbl) => tbl.wealthId.equals(wealth.id)))
        .get();
  }

  Stream<List<WealthValue>> watchEntriesInWealth(Wealth wealth) {
    return (select(wealthValues)..where((t) => t.wealthId.equals(wealth.id)))
        .watch();
  }
}
