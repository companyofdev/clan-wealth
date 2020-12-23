import 'package:clan_wealth/persistent/wealth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class WealthTile extends StatelessWidget {
  final Wealth wealth;
  final Function onTap;

  WealthTile({this.wealth, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: 1.0,
              color: Colors.white24,
            ),
          ),
        ),
        child: Icon(
          IconDataSolid(wealth.iconCode),
          color: Colors.white,
          size: 30.0,
        ),
      ),
      title: Text(
        wealth.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Date(
            dateTime: DateTime.now(),
          ),
          Amount(amount: 120.0),
        ],
      ),
      trailing: Icon(
        FontAwesomeIcons.ellipsisH,
        color: Colors.white,
        size: 25.0,
      ),
      onTap: onTap,
    );
  }
}

class Date extends StatelessWidget {
  final DateTime dateTime;
  final DateFormat _dateFormat = DateFormat.yMd('en_US');

  Date({@required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          _dateFormat.format(dateTime),
        ),
      ],
    );
  }
}

class Amount extends StatelessWidget {
  final double amount;

  Amount({@required this.amount});

  final NumberFormat formatter =
      NumberFormat.currency(symbol: '', decimalDigits: 1);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.dollarSign,
          size: 14.0,
        ),
        Text(
          formatter.format(amount),
        ),
      ],
    );
  }
}
