import 'package:flutter/material.dart';
import 'package:isn_manager/constant/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onChange;
  CustomTextField(this.icon, {this.hint, @required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        obscureText: hint == 'Password' ? true : false,
        validator: (value) {
          if (value.isEmpty) {
            return hint + ' is empty';
          }
        },
        onSaved: this.onChange,
        cursorColor: primaryColor,
        decoration: InputDecoration(
            prefixIcon: Icon(
              this.icon,
              color: primaryColor,
            ),
            hintText: this.hint,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: primaryColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: primaryColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: primaryColor))),
      ),
    );
  }
}
