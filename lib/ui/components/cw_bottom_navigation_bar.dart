import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CwBottomNavigationBar extends StatelessWidget {
  // final int selectedIndex;
  //
  // final Function onTap;
  //
  // const CwBottomNavigationBar({this.selectedIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      child: BottomAppBar(
        // color: kColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(FontAwesomeIcons.wallet, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.users, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
