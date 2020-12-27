import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        Text(
          "Your Wealth",
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w500),
        ),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.bell,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
