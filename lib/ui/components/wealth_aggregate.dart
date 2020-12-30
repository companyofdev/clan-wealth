import 'package:clan_wealth/model/wealth.dart';
import 'package:clan_wealth/provider/wealth_provider.dart';
import 'package:clan_wealth/service/wealth_service.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class WealthAggregate extends StatelessWidget {
  final NumberFormat _numberFormat =
      NumberFormat.currency(symbol: '', decimalDigits: 1);

  @override
  Widget build(BuildContext context) {
    final _today = DateTime.now();
    final String _currentMonth = formatDate(_today, [yyyy, mm]);
    final String _lastMonth = formatDate(
        DateTime(_today.year, _today.month - 1, _today.day), [yyyy, mm]);
    final _wealthStream = Provider.of<WealthProvider>(context).wealths;
    return StreamBuilder(
      stream: _wealthStream,
      builder: (context, AsyncSnapshot<List<Wealth>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Loading(size: 100.0),
          );
        }

        final _wealths = snapshot.data;
        final currentAmount = _wealths
            .map((wealth) => wealth.monthlyBalance[_currentMonth]?.balance)
            .reduce((total, element) => total + element);
        final lastMonthBalance = _wealths.map((wealth) {
          return wealth.monthlyBalance[_lastMonth] != null
              ? wealth.monthlyBalance[_lastMonth].balance
              : 0;
        }).reduce((total, element) => total + element);
        return Column(
          children: [
            Text(
              r'$' + _numberFormat.format(currentAmount),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              r'$' + _numberFormat.format(lastMonthBalance),
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
