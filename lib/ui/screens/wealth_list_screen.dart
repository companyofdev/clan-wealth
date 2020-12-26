import 'package:clan_wealth/ui/components/wealth_list.dart';
import 'package:clan_wealth/ui/components/wealth_container.dart';
import 'package:flutter/material.dart';

class WealthListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: WealthContainer(
        body: WealthList(),
      ),
    );
  }
}
