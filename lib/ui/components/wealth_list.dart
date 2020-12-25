import 'package:clan_wealth/persistent/wealth.dart';
import 'package:clan_wealth/ui/components/wealth_card.dart';
import 'package:clan_wealth/ui/screens/wealth_details_page.dart';
import 'package:clan_wealth/ui/screens/wealth_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class WealthList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildWealthList(context),
    );
  }

  StreamBuilder<List<Wealth>> _buildWealthList(BuildContext context) {
    final wealthDatabase = context.watch<WealthDatabase>();
    final wealthDao = wealthDatabase.wealthDao;
    final wealthHistoricalAmountsDao = wealthDatabase.wealthHistoricalAmountDao;

    return StreamBuilder(
      stream: wealthDao.watchAllWealths(),
      builder: (context, AsyncSnapshot<List<Wealth>> snapshot) {
        final _wealths = snapshot.data ?? List.empty();
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final itemWealth = _wealths[index];
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              secondaryActions: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () {
                      wealthDao.deleteWealth(itemWealth);
                      wealthHistoricalAmountsDao
                          .deleteAllWealthHistoricalAmountsByWealthId(
                              itemWealth.id);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: IconSlideAction(
                    caption: 'Edit',
                    color: Colors.blue,
                    icon: Icons.edit,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WealthEditPage(
                            initialWealth: itemWealth,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
              child: WealthCard(
                wealth: itemWealth,
                onDetailPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WealthDetailsPage(initialWealth: itemWealth),
                    ),
                  );
                },
                onTap: () {},
              ),
            );
          },
          itemCount: _wealths.length,
        );
      },
    );
  }
}
