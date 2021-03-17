import 'package:flutter/material.dart';
import 'package:isn_manager/constant/colors.dart';
import 'package:isn_manager/widgets/customTextField.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  LoginScreen({Key key}) : super(key: key);

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
            CustomTextField(
              Icons.email,
              hint: 'Emai',
            ),
            SizedBox(height: 20),
            CustomTextField(
              Icons.lock,
              hint: 'Password',
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: FlatButton(
                  onPressed: () {
                    if (_globalKey.currentState.validate()) {
                      // do
                    }
                  },
                  color: primaryColor,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
