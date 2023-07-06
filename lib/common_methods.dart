import 'package:chat_app/home/home_screen.dart';
import 'package:flutter/material.dart';

void showLoading(BuildContext context, String text) {
  // TODO: implement  showLoading
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [const CircularProgressIndicator(), Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text),
            )],
          ),
        );
      });
}

@override
void hideLoading(context) {
  Navigator.pop(context);
  // TODO: implement hideLoading
}

@override
void showMessage(BuildContext context, String message, String posActionText,
    Function posAction,
    {String? negActionText, Function? negAction}) {
  // TODO: implement showMessage
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  posAction(context);
                },
                child: Text(posActionText))
          ],
        );
      });
}

void navigateToHome(BuildContext context){
  Navigator.pushNamed(context, HomeScreen.routeName);
}
