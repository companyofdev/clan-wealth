import 'package:clan_wealth/ui/page/forgot_password_page.dart';
import 'package:clan_wealth/ui/page/login_page.dart';
import 'package:clan_wealth/ui/page/master_page.dart';
import 'package:clan_wealth/ui/page/password_confirm_page.dart';
import 'package:clan_wealth/ui/page/signup_confirm_page.dart';
import 'package:clan_wealth/ui/page/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void navigatePushToSignUp(BuildContext context) {
  EasyLoading.dismiss();
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => SignUpPage(),
    ),
  );
}

navigateReplaceToSignUpConfirm(context, {String initialUsername}) {
  EasyLoading.dismiss();
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => SignUpConfirmPage(
        initialUsername: initialUsername,
      ),
    ),
  );
}

navigatePushToSignUpConfirm(context, {String initialUsername}) {
  EasyLoading.dismiss();
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => SignUpConfirmPage(
        initialUsername: initialUsername,
      ),
    ),
  );
}

void navigatePushToForgotPassword(BuildContext context) {
  EasyLoading.dismiss();
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ForgotPasswordPage(),
    ),
  );
}

void navigateReplaceToPasswordConfirm(BuildContext context,
    {String initialUsername}) {
  EasyLoading.dismiss();
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => PasswordConfirmPage(
        initialUsername: initialUsername,
      ),
    ),
  );
}

void navigateResetToLogin(BuildContext context, {String initialUsername}) {
  EasyLoading.dismiss();
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (context) => LoginPage(
        initialUsername: initialUsername,
      ),
    ),
    (route) => false, // Remove all stack
  );
}

void navigateResetToHome(BuildContext context) {
  EasyLoading.dismiss();
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (context) => MasterPage(),
    ),
    (route) => false, // Remove all stack
  );
}
