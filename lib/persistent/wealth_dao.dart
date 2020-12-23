import 'package:clan_wealth/persistent/wealth.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'wealth_dao.g.dart';

@UseDao(tables: [Wealths])
class WealthDao extends DatabaseAccessor<WealthDatabase> with _$WealthDaoMixin {
  WealthDao(WealthDatabase attachedDatabase) : super(attachedDatabase);

  Future<List<Wealth>> getAllWealths() => select(wealths).get();
  Stream<List<Wealth>> watchAllWealths() => select(wealths).watch();
  Future insertWealth(Wealth wealth) => into(wealths).insert(wealth);
  Future updateWealth(Wealth wealth) => update(wealths).replace(wealth);
  Future deleteWealth(Wealth wealth) => delete(wealths).delete(wealth);
}
