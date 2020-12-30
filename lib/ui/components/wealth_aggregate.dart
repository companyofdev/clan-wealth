import 'package:clan_wealth/model/wealth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WealthAggregate extends StatelessWidget {
  final NumberFormat _numberFormat =
      NumberFormat.currency(symbol: '', decimalDigits: 1);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: null,
      builder: (context, AsyncSnapshot<List<Wealth>> snapshot) {
        final _wealths = snapshot.data ?? List.empty();
        final totalAmount = 10.0;
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
