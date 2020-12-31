import 'package:flutter/material.dart';

class TopBannerLayout extends StatelessWidget {
  final Widget bottomContent;
  final Widget topContent;
  final Widget topBar;
  final Decoration bannerDecoration;
  final Decoration _defaultBannerDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [const Color(0xFF81269D), const Color(0xFFEE112D)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      // stops: [0.0, 0.1],
    ),
  );

  final double bannerHighPercent;
  final double overlayPercent;

  TopBannerLayout({
    @required this.bottomContent,
    @required this.topContent,
    @required this.topBar,
    this.bannerDecoration,
    this.bannerHighPercent = 0.30,
    this.overlayPercent = 0.0,
  });

  _buildTopBanner(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * bannerHighPercent,
          padding: EdgeInsets.only(top: 55, left: 20, right: 20),
          decoration: bannerDecoration ?? _defaultBannerDecoration,
          child: Column(
            children: [
              topBar,
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
          top: MediaQuery.of(context).size.height *
              (bannerHighPercent - overlayPercent),
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
