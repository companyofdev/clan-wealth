import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  static AuthService get instance => _instance;

  AuthService._internal();

  User currentUser() {
    return _firebaseAuth.currentUser;
  }

  void dispose() {
    // TODO: implement dispose
  }

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<UserCredential> registerUserInWithEmailAndPassword(
      String email, String password) {
    return _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<User> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (err) {
      print('signInWithEmailAndPassword error: $err');
    }
    return null;
  }

  Future<User> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  Future<User> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
