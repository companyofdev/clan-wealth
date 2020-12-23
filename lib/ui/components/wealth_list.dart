import 'package:clan_wealth/persistent/wealth.dart';
import 'package:clan_wealth/ui/components/wealth_card.dart';
import 'package:clan_wealth/ui/screens/wealth_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WealthList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildWealthList(context),
    );
  }

  StreamBuilder<List<Wealth>> _buildWealthList(BuildContext context) {
    final wealthDatabase = Provider.of<WealthDatabase>(context);
    return StreamBuilder(
      stream: wealthDatabase.watchAllWealths(),
      builder: (context, AsyncSnapshot<List<Wealth>> snapshot) {
        final wealths = snapshot.data ?? List.empty();
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final itemWealth = wealths[index];
            return WealthCard(
              wealth: itemWealth,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WealthDetailsScreen(wealth: itemWealth),
                  ),
                );
              },
            );
          },
          itemCount: wealths.length,
        );
      },
    );
  }
}
