import 'package:clan_wealth/persistent/wealth.dart';
import 'package:clan_wealth/persistent/wealth_dao.dart';
import 'package:clan_wealth/ui/validator/double_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

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
                      _buildDescriptionField(),
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
      validator: RequiredValidator(errorText: 'Title is required'),
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

  void _addWealth(BuildContext context) {
    final wealthDatabase = Provider.of<WealthDatabase>(context);
    final wealthDao = wealthDatabase.wealthDao;
    final wealthHistoricalAmountDao = wealthDatabase.wealthHistoricalAmountDao;
    String _wealthId = Uuid().v4();
    DateTime _updatedDate = DateTime.now();
    Wealth wealth = Wealth(
      id: _wealthId,
      title: _title,
      description: _description,
      amount: _amount,
      iconCode: _iconData.codePoint,
      updatedDate: _updatedDate,
    );
    wealthDao.insertWealth(wealth);

    WealthHistoricalAmount historicalAmount = WealthHistoricalAmount(
      wealthId: _wealthId,
      amount: _amount,
      updatedDate: _updatedDate,
    );
    wealthHistoricalAmountDao.insertWealthHistoricalAmount(historicalAmount);
  }
}
