import 'package:clan_wealth/ui/components/top_banner_layout.dart';
import 'package:clan_wealth/ui/components/wealth_aggregate.dart';
import 'package:clan_wealth/ui/components/wealth_list.dart';
import 'package:flutter/material.dart';

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
        topContent: WealthAggregate(),
        bottomContent: WealthList(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
