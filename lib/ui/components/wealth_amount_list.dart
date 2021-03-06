import 'package:clan_wealth/model/wealth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WealthAmountList extends StatelessWidget {
  final String wealthId;

  WealthAmountList({this.wealthId});

  final NumberFormat _numberFormat =
      NumberFormat.currency(symbol: '', decimalDigits: 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildWealthAmountList(context),
    );
  }

  StreamBuilder<List<Wealth>> _buildWealthAmountList(BuildContext context) {
    print(wealthId);

    return StreamBuilder(
      stream: null,
      builder: (context, AsyncSnapshot<List<Wealth>> snapshot) {
        final _wealthAmounts = snapshot.data ?? List.empty();
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _wealthAmounts.length,
          itemBuilder: (_, index) {
            final wealthAmount = _wealthAmounts[index];
            return Card(
              elevation: 8.0,
              margin: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 6.0,
              ),
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                child: Text(
                  _numberFormat.format(10.0),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
