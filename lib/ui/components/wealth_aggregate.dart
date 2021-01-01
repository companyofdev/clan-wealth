import 'package:clan_wealth/model/model_helper.dart';
import 'package:clan_wealth/model/wealth.dart';
import 'package:clan_wealth/provider/wealth_provider.dart';
import 'package:clan_wealth/ui/helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class WealthAggregate extends StatelessWidget {
  final NumberFormat _numberFormat = NumberFormat('#,###.0#', 'en_US');

  @override
  Widget build(BuildContext context) {
    final _wealthStream = Provider.of<WealthProvider>(context).wealths;
    return StreamBuilder(
      stream: _wealthStream,
      builder: (context, AsyncSnapshot<List<Wealth>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: Loading(size: 100.0));
        }

        final _wealths = snapshot.data;
        final currentTotalBalance = _currentTotalBalance(_wealths);
        final lastMonthTotalBalance = _lastMonthTotalBalance(_wealths);

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.dollarSign),
                SizedBox(
                  width: 2.0,
                ),
                Text(
                  _numberFormat.format(currentTotalBalance),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  changedBalanceText(currentTotalBalance, lastMonthTotalBalance,
                      noChangeText: '--'),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  num _lastMonthTotalBalance(List<Wealth> _wealths) {
    if (_wealths == null || _wealths.length == 0) {
      return 0.0;
    }
    return _wealths
        .map((wealth) => ModelHelper.getPreviousMonthBalance(wealth))
        .reduce((total, element) => total + element);
  }

  double _currentTotalBalance(List<Wealth> _wealths) {
    if (_wealths == null || _wealths.length == 0) {
      return 0.0;
    }
    return _wealths
        .map((wealth) => wealth.currentBalance?.balance ?? 0)
        .reduce((total, element) => total + element);
  }
}
