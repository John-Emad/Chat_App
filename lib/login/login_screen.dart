import 'package:chat_app/login/login_model.dart';
import 'package:chat_app/login/login_navigator.dart';
import 'package:chat_app/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/common_methods.dart' as utils;

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {
  bool isObscure = true;
  String emailAddress = "";
  String password = "";

  var formKey = GlobalKey<FormState>();

  LoginModel loginModel = LoginModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Image.asset(
          "assets/images/background.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              "Log in",
            ),
            centerTitle: true,
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Email-Address
                  TextFormField(
                    decoration:
                        const InputDecoration(label: Text("E-mail Address")),
                    validator: (text) {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text!);
                      if (text.trim().isEmpty) {
                        return "Please, enter a valid email address";
                      }
                      if (!emailValid) {
                        return "Please, Enter a valid Email address";
                      }
                      return null;
                    },
                    onChanged: (text) {
                      emailAddress = text;
                    },
                  ),
                  // Password
                  TextFormField(
                    obscureText: isObscure,
                    decoration: InputDecoration(
                        labelText: 'Password',

                        // this button is used to toggle the password visibility
                        suffixIcon: IconButton(
                            icon: Icon(isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            })),
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please, enter your password name";
                      }
                      if (text.length < 8) {
                        return "Password must be at least 8 characters.";
                      }
                      return null;
                    },
                    onChanged: (text) {
                      password = text;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      validateForm();
                    },
                    child: const Text("Login"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },
                    child: const Text("Create a new account"),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void hideLoading() {
    // TODO: implement   hideLoading
    utils.hideLoading(context);
  }

  @override
  void showLoading() {
    // TODO: implement showLoading
    utils.showLoading(context, "Loading...");
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
    utils.showMessage(context, message, "Ok", (context) {
      Navigator.pop(context);
    });
  }

  void validateForm() {
    if (formKey.currentState?.validate() == true) {
      loginModel.loginAccount(emailAddress: emailAddress, password: password);
    }
  }

  @override
  void navigateToHome() {
    utils.navigateToHome(context);
  }
}
