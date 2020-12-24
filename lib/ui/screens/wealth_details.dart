import 'package:clan_wealth/persistent/wealth.dart';
import 'package:clan_wealth/ui/components/wealth_amount_list.dart';
import 'package:clan_wealth/ui/components/wealth_change_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class WealthDetailsScreen extends StatelessWidget {
  final Wealth wealth;

  WealthDetailsScreen({this.wealth});

  final DateFormat _dateFormat = DateFormat.yMd('en_US');
  final NumberFormat _numberFormat =
      NumberFormat.currency(symbol: '', decimalDigits: 1);

  @override
  Widget build(BuildContext context) {
    final wealthAmount = Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(FontAwesomeIcons.dollarSign, size: 14.0),
          Text(
            _numberFormat.format(wealth.amount),
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 100.0),
        Icon(
          IconDataSolid(wealth.iconCode),
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(
            color: Colors.green,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          wealth.title,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WealthChangeIndicator(
              wealthId: wealth.id,
            ),
            wealthAmount,
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(40.0),
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final updateButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          onPressed: () => {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(FontAwesomeIcons.plus),
              SizedBox(width: 15.0),
              Text(
                "Update Wealth Value",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ));

    final bottomContent = Container(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            updateButton,
          ],
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [topContent, bottomContent],
        ),
      ),
    );
  }
}
