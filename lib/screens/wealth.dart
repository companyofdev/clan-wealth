import 'package:clan_wealth/apis/wealth_api.dart' show Wealth;
import 'package:clan_wealth/components/wealth_card.dart';
import 'package:flutter/material.dart';

class WealthScreen extends StatelessWidget {
  final List<Wealth> wealths;

  const WealthScreen({this.wealths});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: this.wealths.length,
        itemBuilder: (BuildContext context, int index) {
          return WealthCard(
            wealth: this.wealths[index],
          );
        },
      ),
    );
  }
}
