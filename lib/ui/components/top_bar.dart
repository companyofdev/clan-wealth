import 'package:clan_wealth/ui/page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopBar extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget trailing;

  const TopBar({this.leading, this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leading,
        title,
        trailing,
      ],
    );
  }
}
