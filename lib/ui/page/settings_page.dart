import 'package:clan_wealth/service/firebase_auth_service.dart';
import 'package:clan_wealth/ui/common_alerts.dart';
import 'package:clan_wealth/ui/common_navigate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// Copy style from https://www.youtube.com/watch?v=gzfJaDt9ok8
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.all(10.0),
              child: ListTile(
                contentPadding: EdgeInsets.all(10.0),
                title: Text(
                  'Thanh',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(FontAwesomeIcons.userTie),
                ),
                trailing: Icon(Icons.edit),
              ),
            ),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    title: Text(
                      'Change Language',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(FontAwesomeIcons.language),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                  _buildDivider(),
                  ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    title: Text(
                      'Change Password',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(Icons.lock_open_outlined),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    title: Text(
                      'Sign Out',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(Icons.logout),
                    onTap: () {
                      _signOut(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.white10,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
    );
  }

  _signOut(BuildContext context) async {
    context
        .read<FirebaseAuthService>()
        .signOut()
        .then(
          (value) => navigateResetToLogin(context),
        )
        .catchError(
          () => showErrorAlert(
            context: context,
            desc: 'Sign out error',
          ),
        );
  }
}
