import 'package:clan_wealth/model/wealth.dart';
import 'package:clan_wealth/service/auth_service.dart';
import 'package:clan_wealth/service/wealth_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class WealthProvider with ChangeNotifier {
  final WealthService _wealthService = WealthService.instance;
  final AuthService _authService = AuthService.instance;
  String _id;
  String _title;
  String _description;
  String _category;
  List<Holder> _holderDetails;
  List<String> _uids;
  var uuid = Uuid();

  String get title => _title;
  String get description => _description;
  String get category => _category;
  Stream<List<Wealth>> get wealths => _wealthService.watchAll();

  set changeTitle(String title) {
    _title = title;
    notifyListeners();
  }

  set changeDescription(String description) {
    _description = description;
    notifyListeners();
  }

  set changeCategory(String category) {
    _category = category;
    notifyListeners();
  }

  load(Wealth _wealth) {
    if (_wealth == null) {
      _id = null;
      _title = null;
      _description = null;
      _category = null;
      _holderDetails = null;
      _uids = null;
    } else {
      _id = _wealth.id;
      _title = _wealth.title;
      _description = _wealth.description;
      _category = _wealth.category;
      _holderDetails = _wealth.holderDetails;
      _uids = _wealth.uids;
    }
  }

  save() {
    var editingWealth = Wealth(
      id: _id ?? uuid.v4(),
      title: _title,
      description: _description,
      category: _category,
      updatedDate: DateTime.now(),
      holderDetails: _holderDetails ??
          [Holder(uid: _authService.currentUser().uid, role: HolderRole.Owner)],
      uids: _uids ?? [_authService.currentUser().uid],
    );
    _wealthService.upsert(editingWealth);
  }

  remove(Wealth wealth) {
    _wealthService.delete(wealth);
  }
}
