import 'package:clan_wealth/ui/common_alerts.dart';
import 'package:clan_wealth/ui/common_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80.0),
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'images/wallet--v3.png',
                      width: 60.0,
                    ),
                    radius: 40.0,
                  ),
                  SizedBox(height: 10.0),
                  Text('CLAN WEALTH'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildUsernameField(),
                      SizedBox(height: 50.0),
                      RaisedButton(
                        padding: EdgeInsets.all(20.0),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          _resetPassword();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FontAwesomeIcons.unlock,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text('Reset'),
                          ],
                        ),
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(20.0),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildUsernameField() {
    return TextFormField(
      validator: MultiValidator([
        EmailValidator(errorText: 'Email is invalid'),
        RequiredValidator(errorText: 'Email is required'),
      ]),
      onSaved: (String value) {
        _username = value.trim();
      },
      decoration: InputDecoration(
        labelText: 'Email Or Username',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  void _resetPassword() async {
    // try {
    //   EasyLoading.show(status: 'loading...');
    //   await Amplify.Auth.resetPassword(
    //     username: _username,
    //   );
    //   _passwordConfirm();
    // } on AuthError catch (ex) {
    //   print('Sign up error: ' + ex.cause);
    //   showErrorAlert(
    //     context: context,
    //     title: 'Sign up failed',
    //     desc: ex.exceptionList.first.detail.toString(),
    //   );
    // } finally {
    //   EasyLoading.dismiss();
    // }
    // return null;
  }

  void _passwordConfirm() {
    showInfoAlert(
      context: context,
      desc: 'Please check your email for the verification code',
      buttonText: 'To Confirm',
      onPressed: () {
        navigateReplaceToPasswordConfirm(context, initialUsername: _username);
      },
    );
  }
}
