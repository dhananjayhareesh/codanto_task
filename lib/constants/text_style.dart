import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle loginTitle(BuildContext context) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.07,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle label(BuildContext context) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.035,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle forgotPassword(BuildContext context) {
    return TextStyle(
      color: Colors.red,
      fontSize: MediaQuery.of(context).size.width * 0.04,
    );
  }

  static TextStyle loginButton(BuildContext context) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.05,
      color: Colors.white,
    );
  }
}
