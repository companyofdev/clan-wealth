import 'package:clan_wealth/service/auth_service.dart';
import 'package:clan_wealth/ui/common_alerts.dart';
import 'package:clan_wealth/ui/common_navigate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// Copy style from https://www.youtube.com/watch?v=gzfJaDt9ok8
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authUser = Provider.of<AuthService>(context).currentUser();
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
                  _authUser.displayName ?? _authUser.email,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: _authUser.photoURL != null
                      ? NetworkImage(_authUser.photoURL)
                      : AssetImage('images/anonymous.png'),
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
                      'Change Password',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(Icons.lock_open_outlined),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      navigatePushToForgotPassword(context);
                    },
                  ),
                  _buildDivider(),
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
    try {
      await context.read<AuthService>().signOut();
      navigateResetToLogin(context);
    } on FirebaseAuthException catch (error) {
      print('Sign out error: ${error.message}');
      showErrorAlert(
        context: context,
        desc: error.message,
      );
    }
  }
}
