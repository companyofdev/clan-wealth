import 'package:clan_wealth/ui/common_alerts.dart';
import 'package:clan_wealth/ui/common_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  final String initialUsername;

  const LoginPage({this.initialUsername});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _username;
  String _password;

  @override
  void initState() {
    super.initState();
    _username = widget.initialUsername;
  }

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
                      _buildDPasswordField(),
                      SizedBox(height: 50.0),
                      TextButton(
                        onPressed: () {
                          navigatePushToForgotPassword(context);
                        },
                        child: Text('Forgot Password?'),
                      ),
                      RaisedButton(
                        padding: EdgeInsets.all(20.0),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          _signIn();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FontAwesomeIcons.signInAlt,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text('Login'),
                          ],
                        ),
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(20.0),
                        onPressed: () {
                          navigatePushToSignUp(context);
                        },
                        child: Text(
                          'SignUp',
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

  Widget _buildUsernameField() {
    return TextFormField(
      initialValue: _username,
      validator: MultiValidator([
        EmailValidator(errorText: 'Email is invalid'),
        RequiredValidator(errorText: 'Email is required'),
      ]),
      onSaved: (String value) {
        _username = value.trim();
      },
      decoration: InputDecoration(
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildDPasswordField() {
    return TextFormField(
      validator: MultiValidator([
        MinLengthValidator(8,
            errorText: 'Password must contain at least 8 characters'),
        RequiredValidator(errorText: 'Password is required'),
      ]),
      onSaved: (String value) {
        _password = value.trim();
      },
      decoration: InputDecoration(
        labelText: 'Password',
      ),
    );
  }

  void _signIn() async {
    // try {
    //   EasyLoading.show(status: 'loading...');
    //   SignInResult res = await Amplify.Auth.signIn(
    //     username: _username,
    //     password: _password,
    //   );
    //   if (res.isSignedIn) {
    //     navigateResetToHome(context);
    //   }
    // } on AuthError catch (ex) {
    //   print('Sign in error: ' + ex.cause);
    //   showErrorAlert(
    //     context: context,
    //     title: 'Sign in failed',
    //     desc: ex.exceptionList.first.detail.toString(),
    //   );
    // } finally {
    //   EasyLoading.dismiss();
    // }
    // return null;
  }
}
