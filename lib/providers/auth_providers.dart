import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../services/snackbar_service.dart';

enum AuthStatus {
  NotAuthenticated,
  Authenticating,
  Authenticated,
  UserNotFound,
  Error,
}

class AuthProvider extends ChangeNotifier {
  User? user;
  late AuthStatus status;
  late FirebaseAuth _auth;
  static AuthProvider instance = AuthProvider();
  
  // Initialize Firebase in your main.dart before running the app
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  AuthProvider() {
    _auth = FirebaseAuth.instance;
    status = AuthStatus.NotAuthenticated;
    // Listen to auth state changes
    _auth.authStateChanges().listen((User? user) {
      this.user = user;
      notifyListeners();
    });
  }

  Future<void> loginUserWithEmailandPassword(String _email, String _password) async {
    status = AuthStatus.Authenticating;
      notifyListeners();

    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password
      );

      user = result.user;
      status = AuthStatus.Authenticated;
      SnackbarService.instance.showSnackSuccess("Welcome, $user?.displayName ?? 'Guest'");
      print("Logged In Successfully");
      
    } catch (e) {
      status = AuthStatus.Error;
      SnackbarService.instance.showSnackError("Error Authenticating");
      print("Login Error: $e"); // Rethrow to handle the error in the UI
    } finally {
      notifyListeners();
    }
  }

  // Add logout functionality
  Future<void> logout() async {
    try {
      await _auth.signOut();
      status = AuthStatus.NotAuthenticated;
    } catch (e) {
      status = AuthStatus.Error;
      print("Logout Error: $e");
      rethrow;
    } finally {
      notifyListeners();
    }
  }
}
