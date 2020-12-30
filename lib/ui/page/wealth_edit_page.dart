import 'package:clan_wealth/model/wealth.dart';
import 'package:clan_wealth/service/auth_service.dart';
import 'package:clan_wealth/service/wealth_category_service.dart';
import 'package:clan_wealth/service/wealth_service.dart';
import 'package:clan_wealth/ui/validator/double_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class WealthEditPage extends StatefulWidget {
  final Wealth initialWealth;

  const WealthEditPage({this.initialWealth});

  @override
  _WealthEditPageState createState() => _WealthEditPageState();
}

class _WealthEditPageState extends State<WealthEditPage> {
  bool isAdaptive = true;
  bool showTooltips = false;
  bool showSearch = true;

  String _title;
  String _description;
  double _balance;
  WealthCategory _category;

  Wealth _wealth;
  bool _isEditMode;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    this._wealth = widget.initialWealth;
    this._isEditMode = widget.initialWealth != null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? 'Edit Wealth' : 'New Wealth'),
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
                      _buildCategoryField(),
                      _buildBalanceField(),
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
                              _addOrUpdateWealth(context);
                              _formKey.currentState.reset();
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  _isEditMode
                                      ? FontAwesomeIcons.edit
                                      : FontAwesomeIcons.plus,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(_isEditMode ? 'Update' : 'Add'),
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

  Widget _buildTitleField() {
    return TextFormField(
      initialValue: _isEditMode ? _wealth.title : '',
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
      initialValue: _isEditMode ? _wealth.description : '',
      onSaved: (String value) {
        _description = value;
      },
      decoration: InputDecoration(
        labelText: 'Description',
      ),
    );
  }

  Widget _buildCategoryField() {
    return DropdownButtonFormField<WealthCategory>(
      items: WealthCategoryService.getAllCategories
          .map(
            (item) => DropdownMenuItem<WealthCategory>(
              child: Row(
                children: [
                  Icon(item.iconData),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(item.description),
                ],
              ),
              value: item,
            ),
          )
          .toList(),
      onChanged: (selectedItem) {
        _category = selectedItem;
      },
      onSaved: (selectedItem) {
        _category = selectedItem;
      },
      value: _category,
    );
  }

  Widget _buildBalanceField() {
    return TextFormField(
      validator: MultiValidator([
        RequiredValidator(errorText: 'Balance is required'),
        DoubleValidator(errorText: 'Balance is invalid'),
      ]),
      onSaved: (String value) {
        _balance = double.parse(value);
      },
      decoration: InputDecoration(
        labelText: 'Balance',
      ),
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ),
    );
  }

  Future<void> _addOrUpdateWealth(BuildContext context) async {
    String _wealthId = Uuid().v4();
    User _authUser = context.read<AuthService>().currentUser();
    DateTime _updatedDate = DateTime.now();
    Wealth _wealth = Wealth(
      id: _wealthId,
      title: _title,
      description: _description,
      category: _category.name,
      ownerId: _authUser.uid,
      updatedDate: _updatedDate,
    );
    context.read<WealthService>().upsert(_wealth);
  }
}
