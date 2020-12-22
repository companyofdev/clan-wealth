import 'package:clan_wealth/apis/wealth_api.dart';
import 'package:clan_wealth/components/wealth_card.dart';
import 'package:flutter/material.dart';

class WealthScreen extends StatefulWidget {
  @override
  _WealthScreenState createState() => _WealthScreenState();
}

class _WealthScreenState extends State<WealthScreen> {
  List<Wealth> _wealths;

  @override
  void initState() {
    _wealths = getWealths();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: this._wealths.length,
        itemBuilder: (BuildContext context, int index) {
          return WealthCard(
            wealth: this._wealths[index],
          );
        },
      ),
    );
  }
}
