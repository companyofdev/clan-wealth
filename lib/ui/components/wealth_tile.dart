import 'package:clan_wealth/persistent/wealth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class WealthTile extends StatelessWidget {
  final Wealth wealth;
  final Function onTap;
  final Function onDetailPressed;

  WealthTile({this.wealth, this.onTap, this.onDetailPressed});

  final DateFormat _dateFormat = DateFormat.yMd('en_US');
  final NumberFormat _numberFormat =
      NumberFormat.currency(symbol: '', decimalDigits: 1);

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
          IconDataSolid(wealth.iconCode),
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
          _buildUpdatedDate(),
          _buildAmount(),
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

  _buildUpdatedDate() {
    return Row(
      children: [
        Text(_dateFormat.format(wealth.updatedDate)),
      ],
    );
  }

  _buildAmount() {
    return Row(
      children: [
        Icon(FontAwesomeIcons.dollarSign, size: 14.0),
        Text(_numberFormat.format(wealth.amount)),
      ],
    );
  }
}
