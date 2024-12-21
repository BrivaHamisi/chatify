import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus {
  NotAuthenticated,
  Authenticating,
  Authenticated,
  UserNootFound,
  Error,
}

class AuthProvider extends ChangeNotifier {
  User? user;
  late AuthStatus status;
  FirebaseAuth _auth = FirebaseAuth.instance;
  static AuthProvider instance = AuthProvider();

  AuthProvider() {
    _auth = FirebaseAuth.instance;
    status = AuthStatus.NotAuthenticated;
  }

  void loginUserWithEmailandPassword(String _email, String _password) async {
    status = AuthStatus.Authenticating;
    notifyListeners();
    try {
      UserCredential _result = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);

      user = _result.user;
      status = AuthStatus.Authenticated;

      //Navigate yo Homepage
      print("Logged In Successfully");
    } catch (e) {
      status = AuthStatus.Error;

      //Dispplay the error message
    }
    notifyListeners();
  }
}
