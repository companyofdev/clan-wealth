import 'package:clan_wealth/service/auth_service.dart';
import 'package:clan_wealth/ui/common_alerts.dart';
import 'package:clan_wealth/ui/common_navigate.dart';
import 'package:clan_wealth/ui/validator/confirm_value_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _passwordFieldKey =
      GlobalKey<FormFieldState>();

  String _email;
  String _password;

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
                      _buildPasswordField(),
                      _buildConfirmPasswordField(),
                      SizedBox(height: 50.0),
                      RaisedButton(
                        padding: EdgeInsets.all(20.0),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          _signUp();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FontAwesomeIcons.userPlus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text('Sign Up'),
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
        _email = value.trim();
      },
      decoration: InputDecoration(
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextFormField _buildPasswordField() {
    return TextFormField(
      key: _passwordFieldKey,
      validator: MultiValidator([
        MinLengthValidator(6,
            errorText: 'Password must contain at least 6 characters'),
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

  TextFormField _buildConfirmPasswordField() {
    return TextFormField(
      validator: MultiValidator([
        RequiredValidator(errorText: 'Confirm password is required'),
        ConfirmValueValidator(_passwordFieldKey,
            errorText: 'Confirm password does not match password'),
      ]),
      decoration: InputDecoration(
        labelText: 'Confirm Password',
      ),
    );
  }

  void _signUp() async {
    EasyLoading.show(status: 'loading...');
    try {
      await context
          .read<AuthService>()
          .registerUserInWithEmailAndPassword(_email, _password);
      _successSignUp();
    } on FirebaseAuthException catch (error) {
      print('Sign up error: ${error.message}');
      showErrorAlert(
        context: context,
        title: 'Sign up failed',
        desc: error.message,
      );
    }
  }

  void _successSignUp() {
    showSuccessAlert(
      context: context,
      desc: 'You have signed up successfully',
      buttonText: 'To Login',
      onPressed: () {
        navigateResetToLogin(context, initialUsername: _email);
      },
    );
  }
}
