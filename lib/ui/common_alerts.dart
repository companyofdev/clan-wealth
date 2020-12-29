import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const String _kDefaultErrorTitle = 'Error';
const String _kDefaultSuccessTitle = 'Success';
const String _kDefaultInfoTitle = 'Info';
const String _kDefaultDesc = '';
const String _kDefaultButtonText = 'OK';
// const Function _kDefaultOnPressed = (context) => Navigator.pop(context);

void showErrorAlert({
  @required BuildContext context,
  String title,
  String desc,
  String buttonText,
  Function onPressed,
}) {
  EasyLoading.dismiss();
  Alert(
    type: AlertType.error,
    context: context,
    title: title ?? _kDefaultErrorTitle,
    desc: desc ?? _kDefaultDesc,
    buttons: [
      DialogButton(
        child: Text(
          buttonText ?? _kDefaultButtonText,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: onPressed ?? () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();
}

void showSuccessAlert({
  @required BuildContext context,
  String title,
  String desc,
  String buttonText,
  Function onPressed,
}) {
  EasyLoading.dismiss();
  Alert(
    type: AlertType.success,
    context: context,
    title: title ?? _kDefaultSuccessTitle,
    desc: desc ?? _kDefaultDesc,
    buttons: [
      DialogButton(
        child: Text(
          buttonText ?? _kDefaultButtonText,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: onPressed ?? () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();
}

void showInfoAlert({
  @required BuildContext context,
  String title,
  String desc,
  String buttonText,
  Function onPressed,
}) {
  EasyLoading.dismiss();
  Alert(
    type: AlertType.info,
    context: context,
    title: title ?? _kDefaultInfoTitle,
    desc: desc ?? _kDefaultDesc,
    buttons: [
      DialogButton(
        child: Text(
          buttonText ?? _kDefaultButtonText,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: onPressed ?? () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();
}
