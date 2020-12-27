import 'package:clan_wealth/ui/components/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:clan_wealth/persistent/wealth.dart';

class WealthContainer extends StatelessWidget {
  final Widget body;

  WealthContainer({this.body});
  final NumberFormat _numberFormat =
      NumberFormat.currency(symbol: '', decimalDigits: 1);

  StreamBuilder<List<Wealth>> _buildAggregateData(BuildContext context) {
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

  _buildTopBanner(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .30,
          padding: EdgeInsets.only(top: 55, left: 20, right: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFF81269D), const Color(0xFFEE112D)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              // stops: [0.0, 0.1],
            ),
          ),
          child: Column(
            children: [
              TopBar(),
              SizedBox(height: 20),
              _buildAggregateData(context),
            ],
          ),
        ),
        // Container(
        //   height: MediaQuery.of(context).size.height * .60,
        // ),
      ],
    );
  }

  _buildWealthList(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: new EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .20,
          right: 10.0,
          left: 10.0),
      child: body,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildTopBanner(context),
        _buildWealthList(context),
      ],
    );
  }
}
