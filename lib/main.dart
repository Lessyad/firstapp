import 'package:first_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import'package:first_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      initialRoute: LoginScreen.id,
      routes: {

        LoginScreen.id:(context) => LoginScreen(),
        SignupScreen.id:(context)=>SignupScreen(),
      },
    );
    
  }
}

