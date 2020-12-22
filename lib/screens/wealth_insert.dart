import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class WealthInsertScreen extends StatefulWidget {
  @override
  _WealthInsertScreenState createState() => _WealthInsertScreenState();
}

class _WealthInsertScreenState extends State<WealthInsertScreen> {
  IconData _iconData = FontAwesomeIcons.landmark;
  bool isAdaptive = true;
  bool showTooltips = false;
  bool showSearch = true;

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

      debugPrint('Picked Icon:  $icon');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Wealth'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTitleField(),
                  _buildAmountField(),
                  _buildIconField(),
                  SizedBox(height: 100.0),
                  ButtonBar(
                    children: [
                      FlatButton(
                        padding: EdgeInsets.all(10.0),
                        onPressed: () {},
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
                        onPressed: () {},
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
    );
  }

  Widget _buildTitleField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Title',
      ),
    );
  }

  Widget _buildAmountField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Value',
      ),
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ),
    );
  }

  Widget _buildIconField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
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
                size: 30.0,
              ),
              onPressed: _pickIcon),
        ],
      ),
    );
  }
}
