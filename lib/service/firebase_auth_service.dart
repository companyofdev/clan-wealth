import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAUth;

  FirebaseAuthService(this._firebaseAUth);

  Future<User> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  void dispose() {
    // TODO: implement dispose
  }

  Stream<User> get authStateChanges => _firebaseAUth.authStateChanges();

  Future<User> registerUserInWithEmailAndPassword(
      String email, String password) {
    // TODO: implement registerUserInWithEmailAndPassword
    throw UnimplementedError();
  }

  Future<User> sendPasswordResetEmail(String email) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
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
