import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAUth;

  AuthService(this._firebaseAUth);

  User currentUser() {
    return _firebaseAUth.currentUser;
  }

  void dispose() {
    // TODO: implement dispose
  }

  Stream<User> get authStateChanges => _firebaseAUth.authStateChanges();

  Future<UserCredential> registerUserInWithEmailAndPassword(
      String email, String password) {
    return _firebaseAUth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _firebaseAUth.sendPasswordResetEmail(email: email);
  }

  Future<User> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return _firebaseAUth.signInWithEmailAndPassword(
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
    return _firebaseAUth.signOut();
  }
}
