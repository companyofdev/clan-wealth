import 'package:clan_wealth/persistent/wealth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WealthChangeIndicator extends StatelessWidget {
  final String wealthId;

  WealthChangeIndicator({this.wealthId});

  final NumberFormat _numberFormat =
      NumberFormat.currency(symbol: '', decimalDigits: 1);

  _queryLatestWealthAmounts(BuildContext context) {
    final wealthDatabase = Provider.of<WealthDatabase>(context);
    final wealthHistoricalAmountDao = wealthDatabase.wealthHistoricalAmountDao;
    return wealthHistoricalAmountDao.watchLimitWealthHistoricalAmountByWealthId(
        wealthId, 2);
  }

  _buildIndicator(BuildContext context) {
    return StreamBuilder(
      stream: _queryLatestWealthAmounts(context),
      builder: (BuildContext context,
          AsyncSnapshot<List<WealthHistoricalAmount>> snapshot) {
        double changedAmount = 0.0;

        if (snapshot.hasData) {
          final historicalAmounts = snapshot.data;
          if (historicalAmounts.length == 2) {
            changedAmount =
                historicalAmounts[0].amount - historicalAmounts[1].amount;
          }
        }

        var iconData = changedAmount >= 0
            ? FontAwesomeIcons.levelUpAlt
            : FontAwesomeIcons.levelDownAlt;

        var indicatorColor = changedAmount >= 0.0 ? Colors.green : Colors.red;

        final levelIndicator = Icon(
          iconData,
          color: indicatorColor,
          size: 25.0,
        );

        final String changedAmountString = changedAmount != 0.0
            ? '\$' + _numberFormat.format(changedAmount)
            : '--';

        return Container(
          child: Row(
            children: [
              levelIndicator,
              SizedBox(width: 1.0),
              Text(
                changedAmountString,
                style: TextStyle(
                  color: indicatorColor,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildIndicator(context);
  }
}
