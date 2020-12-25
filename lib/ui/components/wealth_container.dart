import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:clan_wealth/persistent/wealth.dart';

class WealthContainer extends StatelessWidget {
  final Widget body;

  WealthContainer({this.body});
  final NumberFormat _numberFormat =
      NumberFormat.currency(symbol: '', decimalDigits: 1);

  StreamBuilder<List<Wealth>> _buildAggregateData(BuildContext context) {
    final wealthDatabase = context.watch<WealthDatabase>();
    final wealthDao = wealthDatabase.wealthDao;
    return StreamBuilder(
      stream: wealthDao.watchAllWealths(),
      builder: (context, AsyncSnapshot<List<Wealth>> snapshot) {
        final _wealths = snapshot.data ?? List.empty();
        final totalAmount =
            _wealths.fold<double>(0.0, (sum, item) => sum + item.amount);
        return Column(
          children: [
            Text(
              r'$' + _numberFormat.format(totalAmount),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold),
            ),
            // SizedBox(height: 20),
            // Text(
            //   r"+ $3,157.67 (23%)",
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 18.0,
            //       fontWeight: FontWeight.w300),
            // ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
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
                  Row(
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
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.bell,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildAggregateData(context),
                ],
              ),
            ),
            // Container(
            //   height: MediaQuery.of(context).size.height * .60,
            // ),
          ],
        ),
        Container(
          alignment: Alignment.topCenter,
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .20,
              right: 10.0,
              left: 10.0),
          child: new Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: body,
          ),
        ),
      ],
    );
  }
}
