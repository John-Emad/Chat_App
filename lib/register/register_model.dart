import 'package:chat_app/register/register_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterModel extends ChangeNotifier {
  late RegisterNavigator navigator;

  void registerNewAccount(
      {required String emailAddress,
      required String password,
      required String firstName,
      required String lastName,
      required String userName}) async {
    try {
      /// Show Loading
      navigator.showLoading(); /// Call back using interface (Abstract methods)

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      /// Hide Loading
      navigator.hideLoading();

      /// Login
      navigator.navigateToHome();

      print(credential.user?.uid);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        /// Hide Loading
        navigator.hideLoading();
        /// Show message
        navigator.showMessage('The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        /// Hide Loading
        navigator.hideLoading();
        /// Show message
        navigator.showMessage('The account already exists for that email.');

      }
    } catch (e) {
      /// Hide Loading
      navigator.hideLoading();
      /// Show message
      navigator.showMessage('Something went wrong $e');
    }
  }
}
