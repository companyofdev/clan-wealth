import 'package:clan_wealth/model/wealth.dart';
import 'package:clan_wealth/service/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WealthService {
  static const String kWealthCollectionName = 'wealths';
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final AuthService _authService = AuthService.instance;

  static final WealthService _instance = WealthService._internal();

  WealthService._internal();

  factory WealthService() {
    return _instance;
  }

  static WealthService get instance => _instance;

  // Get
  Stream<List<Wealth>> watchAll({String owner}) {
    var _ownerId = owner ?? _authService.currentUser().uid;
    return _fireStore
        .collection(kWealthCollectionName)
        .where('ownerId', isEqualTo: _ownerId)
        .snapshots(includeMetadataChanges: true)
        .map(
          (snapshot) => snapshot.docs
              .map(
                (item) => Wealth.fromJson(item.data()),
              )
              .toList(),
        );
  }

  // Upsert
  Future<void> upsert(Wealth wealth) {
    var options = SetOptions(merge: true);
    return _fireStore
        .collection(kWealthCollectionName)
        .doc(wealth.id)
        .set(wealth.toMap(), options);
  }

  // Delete
  Future<void> delete(Wealth wealth) {
    return _fireStore.collection(kWealthCollectionName).doc(wealth.id).delete();
  }

  Future<void> deleteById(String wealthId) {
    return _fireStore.collection(kWealthCollectionName).doc(wealthId).delete();
  }
}
