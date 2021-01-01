import 'package:clan_wealth/model/wealth.dart';
import 'package:flutter/material.dart';

class HolderList extends StatelessWidget {
  const HolderList({@required this.holders});

  final List<Holder> holders;

  @override
  Widget build(BuildContext context) {
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
                            label: Text(
                              holder.displayName ?? '',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
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
