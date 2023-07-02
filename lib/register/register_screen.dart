import 'package:chat_app/register/register_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "registerScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isObscure = true;
  String firstName = "";
  String lastName = "";
  String userName = "";
  String emailAddress = "";
  String password = "";
  var formKey = GlobalKey<FormState>();
  RegisterModel registerModel = RegisterModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => registerModel,
      child: Stack(
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
                "Create Account",
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
                    // First name
                    TextFormField(
                      decoration:
                          const InputDecoration(label: Text("First name")),
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please, enter your first name";
                        }
                        return null;
                      },
                      onChanged: (text) {
                        firstName = text;
                      },

                    ),
                    // Last name
                    TextFormField(
                      decoration: const InputDecoration(label: Text("Last name")),
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please, enter your last name";
                        }
                        return null;
                      },
                      onChanged: (text) {
                        lastName = text;
                      },
                    ),
                    // User name
                    TextFormField(
                      decoration: const InputDecoration(label: Text("User name")),
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please, enter your user name";
                        }
                        return null;
                      },
                      onChanged: (text) {
                        userName = text;
                      },
                    ),
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
                      child: const Text("Create Account"),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> validateForm() async {
    if (formKey.currentState?.validate() == true) {
      registerModel.registerNewAccount(
          emailAddress: emailAddress,
          password: password,
          firstName: firstName,
          lastName: lastName,
          userName: userName);
    }
  }
}
