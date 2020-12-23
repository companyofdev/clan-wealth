import 'package:clan_wealth/persistent/wealth.dart';
import 'package:clan_wealth/persistent/wealth_dao.dart';
import 'package:clan_wealth/ui/components/wealth_card.dart';
import 'package:clan_wealth/ui/screens/wealth_details.dart';
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
    final wealthDao = Provider.of<WealthDao>(context);
    return StreamBuilder(
      stream: wealthDao.watchAllWealths(),
      builder: (context, AsyncSnapshot<List<Wealth>> snapshot) {
        final wealths = snapshot.data ?? List.empty();
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final itemWealth = wealths[index];
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
                          WealthDetailsScreen(wealth: itemWealth),
                    ),
                  );
                },
                onTap: () {},
              ),
            );
          },
          itemCount: wealths.length,
        );
      },
    );
  }
}
