import 'package:clan_wealth/persistent/wealth.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'wealth_historical_amount_dao.g.dart';

@UseDao(tables: [WealthHistoricalAmounts])
class WealthHistoricalAmountDao extends DatabaseAccessor<WealthDatabase>
    with _$WealthHistoricalAmountDaoMixin {
  WealthHistoricalAmountDao(WealthDatabase attachedDatabase)
      : super(attachedDatabase);

  Future<List<WealthHistoricalAmount>> getAllWealthHistoricalAmountByWealthId(
          String wealthId) =>
      (select(wealthHistoricalAmounts)
            ..where((tbl) => tbl.wealthId.equals(wealthId)))
          .get();
  Stream<List<WealthHistoricalAmount>> watchAllWealthHistoricalAmountByWealthId(
          String wealthId) =>
      (select(wealthHistoricalAmounts)
            ..where((tbl) => tbl.wealthId.equals(wealthId)))
          .watch();

  Future insertWealthHistoricalAmount(WealthHistoricalAmount amount) =>
      into(wealthHistoricalAmounts).insert(amount);
  Future updateWealthHistoricalAmount(WealthHistoricalAmount amount) =>
      update(wealthHistoricalAmounts).replace(amount);
  Future deleteWealthHistoricalAmount(WealthHistoricalAmount amount) =>
      delete(wealthHistoricalAmounts).delete(amount);
}
