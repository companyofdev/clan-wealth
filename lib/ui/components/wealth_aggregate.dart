import 'package:clan_wealth/model/wealth.dart';
import 'package:clan_wealth/provider/wealth_provider.dart';
import 'package:clan_wealth/ui/common_number_format.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class WealthAggregate extends StatelessWidget {
  final NumberFormat _numberFormat = NumberFormat('#,###.0#', 'en_US');

  @override
  Widget build(BuildContext context) {
    final String _currentMonth = Jiffy().format('yyyyMM');
    final String _lastMonth = (Jiffy()..subtract(months: 1)).format('yyyyMM');
    final _wealthStream = Provider.of<WealthProvider>(context).wealths;
    return StreamBuilder(
      stream: _wealthStream,
      builder: (context, AsyncSnapshot<List<Wealth>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: Loading(size: 100.0));
        }

        final _wealths = snapshot.data;
        final currentBalance = _currentBalance(_wealths, _currentMonth);
        final lastMonthBalance = _lastMonthBalance(_wealths, _lastMonth);

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
                  _numberFormat.format(currentBalance),
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
                  changedBalanceText(currentBalance, lastMonthBalance,
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

  num _lastMonthBalance(List<Wealth> _wealths, String _lastMonth) {
    if (_wealths == null || _wealths.length == 0) {
      return 0.0;
    }
    return _wealths.map((wealth) {
      return wealth.monthlyBalance[_lastMonth] != null
          ? wealth.monthlyBalance[_lastMonth].balance
          : 0;
    }).reduce((total, element) => total + element);
  }

  double _currentBalance(List<Wealth> _wealths, String _currentMonth) {
    if (_wealths == null || _wealths.length == 0) {
      return 0.0;
    }
    return _wealths
        .map((wealth) => wealth.monthlyBalance[_currentMonth]?.balance)
        .reduce((total, element) => total + element);
  }
}
