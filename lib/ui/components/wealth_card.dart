import 'package:clan_wealth/model/wealth.dart';
import 'package:clan_wealth/ui/colors.dart';
import 'package:clan_wealth/ui/components/wealth_tile.dart';
import 'package:flutter/material.dart';

class WealthCard extends StatelessWidget {
  final Wealth wealth;
  final Function onTap;
  final Function onDetailPressed;

  const WealthCard({@required this.wealth, this.onTap, this.onDetailPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(
        // horizontal: 10.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(color: kCardColor),
        child: WealthTile(
          wealth: wealth,
          onDetailPressed: onDetailPressed,
          onTap: onTap,
        ),
      ),
    );
  }
}
