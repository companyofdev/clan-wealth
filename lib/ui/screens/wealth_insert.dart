import 'package:clan_wealth/persistent/wealth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:provider/provider.dart';

class WealthInsertScreen extends StatefulWidget {
  @override
  _WealthInsertScreenState createState() => _WealthInsertScreenState();
}

class _WealthInsertScreenState extends State<WealthInsertScreen> {
  bool isAdaptive = true;
  bool showTooltips = false;
  bool showSearch = true;

  String _title;
  String _description;
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
                      _buildDescriptionField(),
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
                              _addWealth(context);
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

  Widget _buildDescriptionField() {
    return TextFormField(
      onSaved: (String value) {
        _description = value;
      },
      decoration: InputDecoration(
        labelText: 'Description',
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

  void _addWealth(BuildContext context) {
    final wealthDatabase = Provider.of<WealthDatabase>(context);
    Wealth wealth = Wealth(
      title: _title,
      description: _description,
      iconCode: _iconData.codePoint,
    );
    wealthDatabase.insertWealth(wealth);
  }
}
