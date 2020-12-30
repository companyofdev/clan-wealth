import 'package:clan_wealth/ui/components/top_bar.dart';
import 'package:flutter/material.dart';

class TopBannerLayout extends StatelessWidget {
  final Widget bottomContent;
  final Widget topContent;

  TopBannerLayout({this.bottomContent, this.topContent});

  _buildTopBanner(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .30,
          padding: EdgeInsets.only(top: 55, left: 20, right: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFF81269D), const Color(0xFFEE112D)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              // stops: [0.0, 0.1],
            ),
          ),
          child: Column(
            children: [
              TopBar(),
              SizedBox(height: 20),
              topContent,
            ],
          ),
        ),
      ],
    );
  }

  _buildWealthList(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: new EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .20,
          right: 10.0,
          left: 10.0),
      child: bottomContent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildTopBanner(context),
        _buildWealthList(context),
      ],
    );
  }
}
