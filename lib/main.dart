import 'package:flutter/material.dart';
import 'package:isn_manager/provider/modalHud.dart';
import 'package:isn_manager/screens/homeScreen.dart';
import 'package:isn_manager/screens/loginScreen.dart';
import 'package:isn_manager/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModalHud>(
        create: (context) => ModalHud(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.id,
          home: FutureBuilder(
            future: Auth.getToken(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return LoginScreen();
              }
            },
          ),
          routes: {
            LoginScreen.id: (context) => LoginScreen(),
            HomeScreen.id: (context) => HomeScreen(
                  title: 'hello',
                )
          },
        ));
  }
}
