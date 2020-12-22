import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Wealth> _wealths = [
  Wealth(
    title: 'Commerzbank',
    amount: 1200.0,
    icon: FontAwesomeIcons.landmark,
    updatedDate: DateTime.parse('2020-02-27'),
  ),
  Wealth(
    title: 'Cash',
    amount: 450.0,
    icon: FontAwesomeIcons.moneyBill,
    updatedDate: DateTime.parse('2020-02-27'),
  ),
  Wealth(
    title: 'Loan',
    amount: 116.0,
    icon: FontAwesomeIcons.handHoldingUsd,
    updatedDate: DateTime.parse('2020-02-27'),
  ),
  Wealth(
    title: 'Property',
    amount: 45000.0,
    icon: FontAwesomeIcons.home,
    updatedDate: DateTime.parse('2020-02-27'),
  ),
];

List<Wealth> getWealths() {
  return _wealths;
}

void addWealth(Wealth wealth) {
  _wealths.add(wealth);
}

class Wealth {
  final String title;
  final double amount;
  final IconData icon;
  final DateTime updatedDate;

  Wealth({this.title, this.amount, this.icon, this.updatedDate});
}
