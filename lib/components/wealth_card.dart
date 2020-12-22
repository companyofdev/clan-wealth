import 'package:clan_wealth/apis/wealth_api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        child: WealthListTile(
          title: wealth.title,
          amount: wealth.amount,
          icon: wealth.icon,
        ),
      ),
    );
  }
}

class WealthListTile extends StatelessWidget {
  final String title;
  final double amount;
  final IconData icon;

  const WealthListTile({this.title, this.amount, this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(
          this.icon,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      title: Text(
        this.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: <Widget>[
          Icon(
            FontAwesomeIcons.dollarSign,
            color: Colors.yellowAccent,
            size: 16.0,
          ),
          Text(this.amount.toStringAsFixed(1),
              style: TextStyle(color: Colors.white))
        ],
      ),
      trailing: Icon(FontAwesomeIcons.edit, color: Colors.white, size: 25.0),
    );
  }
}
