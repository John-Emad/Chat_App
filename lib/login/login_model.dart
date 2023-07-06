import 'package:chat_app/login/login_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/firebase/firebase_errors.dart';

class LoginModel extends ChangeNotifier {
  late LoginNavigator navigator;

  void loginAccount({required String emailAddress, required String password,}) async {
    try {
      /// Show Loading
      navigator.showLoading();

      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      print("ID: ${credential.user!.uid}");
      /// Hide Loading
      navigator.hideLoading();

      /// Login
      navigator.navigateToHome();

    }

    on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.userNotFound) {
        /// Hide Loading
        navigator.hideLoading();
        /// Show Message
        navigator.showMessage("No user found for that email.");

      } else if (e.code == FirebaseErrors.wrongPassword) {
        /// Hide Loading
        navigator.hideLoading();
        /// Show Message
        navigator.showMessage('Wrong password provided for that user.');

      }
    }
  }
}
