import 'package:clan_wealth/model/model_helper.dart';
import 'package:clan_wealth/model/wealth.dart';
import 'package:clan_wealth/service/wealth_category_service.dart';
import 'package:clan_wealth/ui/helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class WealthTile extends StatelessWidget {
  final Wealth wealth;
  final Function onTap;
  final Function onDetailPressed;

  WealthTile({this.wealth, this.onTap, this.onDetailPressed});

  final NumberFormat _numberFormat = NumberFormat('#,###.0#', 'en_US');

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1.0, color: Colors.white24),
          ),
        ),
        child: Icon(
          WealthCategoryService.getCategoryByName(wealth.category).iconData,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              wealth.title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            _buildAvatars(wealth),
          ],
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildChangedBalance(),
          _buildBalance(),
        ],
      ),
      trailing: IconButton(
        icon: Icon(FontAwesomeIcons.angleRight, color: Colors.white),
        iconSize: 25.0,
        onPressed: onDetailPressed,
      ),
      onTap: onTap,
    );
  }

  Row _buildAvatars(Wealth wealth) {
    final holders = wealth.holderDetails ?? List.empty();
    return Row(
      children: holders
          .map((holder) => CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.white,
                backgroundImage: holder.photoURL != null
                    ? NetworkImage(holder.photoURL)
                    : AssetImage('images/anonymous.png'),
              ))
          .toList(),
    );
  }

  _buildChangedBalance() {
    final currentBalance = wealth.currentBalance?.balance ?? 0.0;
    final previousMonthBalance = ModelHelper.getPreviousMonthBalance(wealth);

    return Row(
      children: [
        Text(changedBalanceText(currentBalance, previousMonthBalance,
            noChangeText: '--')),
      ],
    );
  }

  _buildBalance() {
    return Row(
      children: [
        Icon(FontAwesomeIcons.dollarSign, size: 14.0),
        Text(
          _numberFormat.format(wealth.currentBalance != null
              ? wealth.currentBalance.balance
              : 0.0),
        ),
      ],
    );
  }
}
