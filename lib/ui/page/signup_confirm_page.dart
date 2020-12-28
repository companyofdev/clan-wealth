import 'package:clan_wealth/ui/common_alerts.dart';
import 'package:clan_wealth/ui/common_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpConfirmPage extends StatefulWidget {
  final String initialUsername;

  const SignUpConfirmPage({this.initialUsername});

  @override
  _SignUpConfirmPageState createState() => _SignUpConfirmPageState();
}

class _SignUpConfirmPageState extends State<SignUpConfirmPage> {
  String _username;
  String _confirmCode;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      _buildConfirmCodeField(),
                      SizedBox(height: 50.0),
                      RaisedButton(
                        padding: EdgeInsets.all(20.0),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          _signUpConfirm();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FontAwesomeIcons.check,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text('Confirm'),
                          ],
                        ),
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(20.0),
                        onPressed: () {
                          navigateResetToLogin(
                            context,
                            initialUsername: _username,
                          );
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

  TextFormField _buildConfirmCodeField() {
    return TextFormField(
      validator: MultiValidator([
        RequiredValidator(errorText: 'Code is required'),
      ]),
      onSaved: (String value) {
        _confirmCode = value.trim();
      },
      decoration: InputDecoration(
        labelText: 'Confirm Code',
      ),
    );
  }

  void _signUpConfirm() async {
    // try {
    //   EasyLoading.show(status: 'loading...');
    //
    //   SignUpResult res = await Amplify.Auth.confirmSignUp(
    //     username: _username,
    //     confirmationCode: _confirmCode,
    //   );
    //   print(res.nextStep.codeDeliveryDetails.deliveryMedium);
    //   print(res.nextStep.additionalInfo.toString());
    //   if (res.isSignUpComplete) {
    //     showSuccessAlert(
    //       context: context,
    //       desc: 'You have signed up successfully',
    //       buttonText: 'To Login',
    //       onPressed: () {
    //         navigateResetToLogin(context, initialUsername: _username);
    //       },
    //     );
    //   }
    // } on AuthError catch (ex) {
    //   print('Sign up error: ' + ex.cause);
    //   showErrorAlert(
    //     context: context,
    //     title: 'Sign up confirm failed',
    //     desc: ex.exceptionList.first.detail.toString(),
    //   );
    // } finally {
    //   EasyLoading.dismiss();
    // }
    // return null;
  }
}
