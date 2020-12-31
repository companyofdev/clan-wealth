import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WealthCategoryService {
  static List<WealthCategory> _categories = [
    WealthCategory(
        iconData: FontAwesomeIcons.moneyBillAlt,
        name: 'cash',
        description: 'Cash'),
    WealthCategory(
        iconData: FontAwesomeIcons.piggyBank,
        name: 'saving',
        description: 'Saving'),
    WealthCategory(
        iconData: FontAwesomeIcons.landmark,
        name: 'bank',
        description: 'Bank Account'),
    WealthCategory(
        iconData: FontAwesomeIcons.home,
        name: 'realEstate',
        description: 'Real Estate'),
    WealthCategory(
        iconData: FontAwesomeIcons.home,
        name: 'otherProperty',
        description: 'Other Property'),
    WealthCategory(
        iconData: FontAwesomeIcons.home, name: 'stock', description: 'Stock'),
  ];
  static List<WealthCategory> get getAllCategories => _categories;

  static WealthCategory getCategoryByName(String name,
      {WealthCategory defaultCategory}) {
    defaultCategory ??= WealthCategory(
        name: '', description: '', iconData: FontAwesomeIcons.dollarSign);
    return _categories.firstWhere((cat) => cat.name == name,
        orElse: () => defaultCategory);
  }
}

@immutable
class WealthCategory {
  final IconData iconData;
  final String name;
  final String description;

  WealthCategory({this.iconData, this.name, this.description});
}
