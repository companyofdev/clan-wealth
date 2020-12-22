import 'package:clan_wealth/apis/wealth_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class WealthInsertScreen extends StatefulWidget {
  @override
  _WealthInsertScreenState createState() => _WealthInsertScreenState();
}

class _WealthInsertScreenState extends State<WealthInsertScreen> {
  bool isAdaptive = true;
  bool showTooltips = false;
  bool showSearch = true;

  String _title;
  double _amount;
  IconData _iconData = FontAwesomeIcons.landmark;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Wealth'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTitleField(),
                      _buildAmountField(),
                      _buildIconField(),
                      SizedBox(height: 20.0),
                      ButtonBar(
                        children: [
                          FlatButton(
                            padding: EdgeInsets.all(10.0),
                            onPressed: () {
                              _formKey.currentState.reset();
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(FontAwesomeIcons.times),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Cancel'),
                              ],
                            ),
                          ),
                          RaisedButton(
                            padding: EdgeInsets.all(10.0),
                            onPressed: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              _formKey.currentState.save();
                              _addWealth();
                              _formKey.currentState.reset();
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(FontAwesomeIcons.plus),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Add'),
                              ],
                            ),
                          ),
                        ],
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

  _pickIcon() async {
    IconData icon = await FlutterIconPicker.showIconPicker(
      context,
      adaptiveDialog: isAdaptive,
      showTooltips: showTooltips,
      showSearchBar: showSearch,
      iconPickerShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      iconPackMode: IconPack.fontAwesomeIcons,
    );

    if (icon != null) {
      _iconData = icon;
      setState(
        () {},
      );
    }
  }

  Widget _buildTitleField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Title is required';
        }
        return null;
      },
      onSaved: (String value) {
        _title = value;
      },
      decoration: InputDecoration(
        labelText: 'Title',
      ),
    );
  }

  Widget _buildAmountField() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Amount is required';
        }
        if (double.tryParse(value) == null) {
          return 'Amount is invalid';
        }
        return null;
      },
      onSaved: (String value) {
        _amount = double.parse(value);
      },
      decoration: InputDecoration(
        labelText: 'Amount',
      ),
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ),
    );
  }

  Widget _buildIconField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Text(
            'Icon',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(width: 20.0),
          IconButton(
              icon: Icon(
                _iconData,
                size: 35.0,
              ),
              onPressed: _pickIcon),
        ],
      ),
    );
  }

  void _addWealth() {
    Wealth wealth = Wealth(
      title: _title,
      amount: _amount,
      icon: _iconData,
      updatedDate: DateTime.now(),
    );
    addWealth(wealth);
  }
}
