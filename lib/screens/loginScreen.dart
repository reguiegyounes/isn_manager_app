import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:isn_manager/constant/colors.dart';
import 'package:isn_manager/screens/homeScreen.dart';
import 'package:isn_manager/services/auth.dart';
import 'package:isn_manager/widgets/customTextField.dart';

class LoginScreen extends StatelessWidget {
  static String id = '/login';
  Auth auth = new Auth();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  LoginScreen({Key key}) : super(key: key);
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: MediaQuery.of(context).size.height * .3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'ISN',
                      style: TextStyle(color: primaryColor, fontSize: 40),
                    ),
                    Text(
                      'Manager',
                      style: TextStyle(color: primaryColor, fontSize: 40),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            CustomTextField(Icons.email, hint: 'Email', onChange: (value) {
              this._email = value;
            }),
            SizedBox(height: 20),
            CustomTextField(Icons.lock, hint: 'Password', onChange: (value) {
              this._password = value;
            }),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Builder(
                builder: (context) => ElevatedButton(
                    onPressed: () async {
                      if (_globalKey.currentState.validate()) {
                        _globalKey.currentState.save();
                        try {
                          final res = await auth.login(_email, _password);
                          final data = jsonDecode(res) as Map<String, dynamic>;
                          if (!data.containsKey('msg')) {
                            Auth.setToken(data['token']);
                            Navigator.pushNamed(context, HomeScreen.id);
                          } else {
                            if (data['msg'] == 'User does not exist') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('User does not exist')));
                            }
                          }
                        } on Exception catch (e) {
                          print(e.toString());
                        }

                        // Navigator.pushNamed(context, HomeScreen.id);
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryColor)),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
