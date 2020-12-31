import 'package:clan_wealth/ui/components/top_banner_layout.dart';
import 'package:clan_wealth/ui/components/top_bar.dart';
import 'package:clan_wealth/ui/components/wealth_aggregate.dart';
import 'package:clan_wealth/ui/components/wealth_list.dart';
import 'package:clan_wealth/ui/page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class YourWealthPage extends StatefulWidget {
  @override
  _YourWealthPageState createState() => _YourWealthPageState();
}

class _YourWealthPageState extends State<YourWealthPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: TopBannerLayout(
        topBar: _buildTopBar(),
        topContent: WealthAggregate(),
        bottomContent: WealthList(),
        overlayPercent: 0.10,
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsPage(),
              ),
            );
          },
        ),
        Text(
          "Your Wealth",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.bell, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
