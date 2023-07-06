import 'package:chat_app/home/home_screen.dart';
import 'package:chat_app/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/register/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   runApp(MyApp());


  // Ideal time to initialize
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var userProvider = Provider.of<UserProvider>(context);
    return MaterialApp(
      routes: {
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
