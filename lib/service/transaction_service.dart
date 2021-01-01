import 'package:clan_wealth/service/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  static const String kTransactionCollectionName = 'transactions';
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final AuthService _authService = AuthService.instance;

  static final TransactionService _instance = TransactionService._internal();

  TransactionService._internal();

  factory TransactionService() {
    return _instance;
  }

  static TransactionService get instance => _instance;
}
