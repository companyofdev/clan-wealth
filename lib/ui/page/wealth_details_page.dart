import 'package:clan_wealth/model/wealth.dart';
import 'package:clan_wealth/ui/components/top_banner_layout.dart';
import 'package:clan_wealth/ui/components/wealth_amount_changed_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WealthDetailsPage extends StatelessWidget {
  final Wealth initialWealth;

  const WealthDetailsPage({this.initialWealth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF303030),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ),
      body: _buildBodyContent(context),
    );
    // return TopBannerLayout(
    //   topBar: _buildTopBar(context),
    //   topContent: _buildTopContentText(),
    //   bottomContent: Container(
    //     child: Text('Bottom Content'),
    //   ),
    //   bannerDecoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
    //   bannerHighPercent: 0.40,
    // );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ],
    );
  }

  Widget _buildTopContentText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // SizedBox(height: 100.0),
          Icon(
            FontAwesomeIcons.landmark,
            color: Colors.white,
            size: 40.0,
          ),
          Container(
            width: 90.0,
            child: new Divider(
              color: Colors.green,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            initialWealth.title,
            style: TextStyle(color: Colors.white, fontSize: 45.0),
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WealthAmountChangedIndicator(
                wealthId: initialWealth.id,
              ),
              _buildWealthBalance(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWealthBalance() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(FontAwesomeIcons.dollarSign, size: 14.0),
          Text(
            '10.0',
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }

  _buildBodyContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildHolders(),
          _buildMonthlyChart(),
          Container(
            child: Text('Bottom Content'),
          ),
        ],
      ),
    );
  }

  _buildMonthlyChart() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 150.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
      ),
    );
  }

  _buildHolders() {
    final List<Holder> holders = initialWealth.holderDetails ?? List.empty();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Holders',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Wrap(
                  children: holders
                      .map(
                        (holder) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            elevation: 5.0,
                            backgroundColor: Color(0xFFFFAA91),
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            avatar: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: holder.photoURL != null
                                  ? NetworkImage(holder.photoURL)
                                  : AssetImage('images/anonymous.png'),
                            ),
                            label: Text('Thanh'),
                            labelPadding: EdgeInsets.all(15.0),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
