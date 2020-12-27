import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:clan_wealth/ui/page/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Column(
                children: [
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

  _signOut(BuildContext context) async {
    try {
      await Amplify.Auth.signOut();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
        (route) => false, // Remove all stack
      );
    } on AuthError catch (err) {
      print('Sign out error:' + err.toString());
    }
  }
}
