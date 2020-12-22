import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Wealth> getWealths() {
  return [
    Wealth(
      title: 'Commerzbank',
      amount: 1200.0,
      icon: FontAwesomeIcons.landmark,
    ),
    Wealth(
      title: 'Cash',
      amount: 450.0,
      icon: FontAwesomeIcons.moneyBill,
    ),
    Wealth(
      title: 'Loan',
      amount: 116.0,
      icon: FontAwesomeIcons.handHoldingUsd,
    ),
    Wealth(
      title: 'Property',
      amount: 45000.0,
      icon: FontAwesomeIcons.home,
    ),
  ];
}

class Wealth {
  final String title;
  final double amount;
  final IconData icon;

  Wealth({this.title, this.amount, this.icon});
}
