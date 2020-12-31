import 'package:clan_wealth/model/wealth.dart';
import 'package:clan_wealth/ui/components/wealth_amount_changed_indicator.dart';
import 'package:clan_wealth/ui/validator/double_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

class WealthDetailsPage extends StatefulWidget {
  final Wealth initialWealth;

  WealthDetailsPage({this.initialWealth});

  @override
  _WealthDetailsPageState createState() => _WealthDetailsPageState();
}

class _WealthDetailsPageState extends State<WealthDetailsPage> {
  Wealth _wealth;

  @override
  void initState() {
    _wealth = widget.initialWealth;
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double _amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopContent(context),
            _buildBottomContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountField() {
    return TextFormField(
      validator: MultiValidator([
        RequiredValidator(errorText: 'Amount is required'),
        DoubleValidator(errorText: 'Amount is invalid'),
      ]),
      onSaved: (String value) {
        _amount = double.parse(value);
      },
      decoration: InputDecoration(
        labelText: 'Initial Amount',
      ),
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ),
    );
  }

  _showInputAlertDialog(BuildContext context) {
    // set up the button
    Widget updateButton = RaisedButton(
      child: Text('Update'),
      onPressed: () {
        if (!_formKey.currentState.validate()) {
          return;
        }
        _formKey.currentState.save();
        _updateWealthAmount(context);
        Navigator.of(context).pop();
      },
    );

    Widget cancelButton = FlatButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text('Cancel'),
    );

    // set up the AlertDialog
    AlertDialog alertDialog = AlertDialog(
      title: Text('Update Wealth Amount'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildAmountField(),
          ],
        ),
      ),
      actions: [
        cancelButton,
        updateButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  Future<void> _updateWealthAmount(BuildContext context) async {
    // TODO
  }

  Widget _buildTopContentText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 100.0),
        Icon(
          FontAwesomeIcons.landmark,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(
            color: Colors.green,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          _wealth.title,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WealthAmountChangedIndicator(
              wealthId: _wealth.id,
            ),
            _buildWealthBalance(),
          ],
        ),
      ],
    );
  }

  Widget _buildWealthBalance() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(FontAwesomeIcons.dollarSign, size: 14.0),
          Text(
            '10.0',
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }

  Widget _buildTopContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(40.0),
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: _buildTopContentText(),
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildUpdateButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdateButton(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          onPressed: () {
            _showInputAlertDialog(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(FontAwesomeIcons.plus),
              SizedBox(width: 15.0),
              Text(
                "Update Wealth Value",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
