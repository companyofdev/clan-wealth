import 'package:clan_wealth/persistent/wealth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WealthAggregate extends StatelessWidget {
  final NumberFormat _numberFormat =
      NumberFormat.currency(symbol: '', decimalDigits: 1);
  @override
  Widget build(BuildContext context) {
    final wealthDatabase = context.watch<WealthDatabase>();
    final wealthDao = wealthDatabase.wealthDao;
    return StreamBuilder(
      stream: wealthDao.watchAllWealths(),
      builder: (context, AsyncSnapshot<List<Wealth>> snapshot) {
        final _wealths = snapshot.data ?? List.empty();
        final totalAmount =
            _wealths.fold<double>(0.0, (sum, item) => sum + item.amount);
        return Column(
          children: [
            Text(
              r'$' + _numberFormat.format(totalAmount),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
