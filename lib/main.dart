import 'package:flutter/material.dart';
import 'package:isn_manager/screens/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {LoginScreen.id: (context) => LoginScreen()},
    );
  }
}
