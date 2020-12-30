import 'package:clan_wealth/model/wealth.dart';
import 'package:clan_wealth/ui/common_number_format.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class WealthTile extends StatelessWidget {
  final Wealth wealth;
  final Function onTap;
  final Function onDetailPressed;

  WealthTile({this.wealth, this.onTap, this.onDetailPressed});

  final NumberFormat _numberFormat = NumberFormat('#,###.0#', 'en_US');
  final String _currentMonth = Jiffy().format('yyyyMM');
  final String _lastMonth = (Jiffy()..subtract(months: 1)).format('yyyyMM');

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1.0, color: Colors.white24),
          ),
        ),
        child: Icon(
          FontAwesomeIcons.landmark,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      title: Text(
        wealth.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildChangedBalance(),
          _buildBalance(),
        ],
      ),
      trailing: IconButton(
        icon: Icon(FontAwesomeIcons.angleRight, color: Colors.white),
        iconSize: 25.0,
        onPressed: onDetailPressed,
      ),
      onTap: onTap,
    );
  }

  _buildChangedBalance() {
    final currentBalance = wealth.monthlyBalance[_currentMonth].balance;
    final lastMonthBalance = wealth.monthlyBalance[_lastMonth] != null
        ? wealth.monthlyBalance[_lastMonth].balance
        : 0.0;

    return Row(
      children: [
        Text(changedBalanceText(currentBalance, lastMonthBalance,
            noChangeText: '--')),
      ],
    );
  }

  _buildBalance() {
    return Row(
      children: [
        Icon(FontAwesomeIcons.dollarSign, size: 14.0),
        Text(
            _numberFormat.format(wealth.monthlyBalance[_currentMonth].balance)),
      ],
    );
  }
}
