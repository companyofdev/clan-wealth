import 'package:clan_wealth/model/wealth.dart';
import 'package:clan_wealth/provider/wealth_provider.dart';
import 'package:clan_wealth/ui/components/wealth_card.dart';
import 'package:clan_wealth/ui/page/wealth_details_page.dart';
import 'package:clan_wealth/ui/page/wealth_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class WealthList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildWealthList(context),
    );
  }

  _buildWealthList(BuildContext context) {
    final _wealthProvider = Provider.of<WealthProvider>(context);

    return StreamBuilder(
      builder: (context, AsyncSnapshot<List<Wealth>> snapshot) {
        if (snapshot.hasData) {
          final _wealths = snapshot.data;
          return _buildListView(_wealths, context, _wealthProvider);
        }
        return Center(
          child: Loading(size: 100.0),
        );
      },
      stream: _wealthProvider.wealths,
    );
  }

  ListView _buildListView(List<Wealth> _wealths, BuildContext context,
      WealthProvider _wealthProvider) {
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
                  _wealthProvider.remove(itemWealth);
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
  }
}
