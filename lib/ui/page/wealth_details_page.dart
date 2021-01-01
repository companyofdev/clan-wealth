import 'package:clan_wealth/model/wealth.dart';
import 'package:clan_wealth/ui/components/holder_list.dart';
import 'package:clan_wealth/ui/components/monthly_balance_chart.dart';
import 'package:flutter/material.dart';

class WealthDetailsPage extends StatelessWidget {
  final Wealth initialWealth;

  const WealthDetailsPage({this.initialWealth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF303030),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ),
      body: _buildBodyContent(context),
    );
  }

  _buildBodyContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildHolders(),
          _buildMonthlyChart(),
          Container(
            child: Text('Bottom Content'),
          ),
        ],
      ),
    );
  }

  _buildMonthlyChart() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: MonthlyBalanceChart(
          chartTitle: 'Monthly Balances',
          initialWealth: initialWealth,
        ),
      ),
    );
  }

  _buildHolders() {
    final List<Holder> holders = initialWealth.holderDetails ?? List.empty();
    return HolderList(holders: holders);
  }
}
