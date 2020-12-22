import 'package:clan_wealth/apis/wealth_api.dart';
import 'package:clan_wealth/screens/wealth_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart' show NumberFormat, DateFormat;

class WealthCard extends StatelessWidget {
  final Wealth wealth;

  const WealthCard({this.wealth});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: WealthListTile(wealth: wealth),
      ),
    );
  }
}

class WealthListTile extends StatelessWidget {
  final Wealth wealth;

  WealthListTile({this.wealth});

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
          wealth.icon,
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
            dateTime: wealth.updatedDate,
          ),
          Amount(amount: wealth.amount),
        ],
      ),
      trailing: Icon(
        FontAwesomeIcons.ellipsisH,
        color: Colors.white,
        size: 25.0,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WealthDetailsScreen(wealth: wealth),
          ),
        );
      },
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
