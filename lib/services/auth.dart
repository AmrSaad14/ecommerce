import 'package:firebase_auth/firebase_auth.dart';

class Auth  {
  final _auth = FirebaseAuth.instance;
  Future <UserCredential> signUp (String _email , String _password) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
    return userCredential;
  }

  Future <UserCredential> signIn (String _email , String _password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
    return userCredential;
  }
}