import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const String _kDefaultTitle = 'Error';
const String _kDefaultDesc = '';
const String _kDefaultButtonText = 'OK';

void showErrorAlert({
  @required BuildContext context,
  String title,
  String desc,
  String buttonText,
}) {
  Alert(
    type: AlertType.error,
    context: context,
    title: title ?? _kDefaultTitle,
    desc: desc ?? _kDefaultDesc,
    buttons: [
      DialogButton(
        child: Text(
          buttonText ?? _kDefaultButtonText,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();
}
