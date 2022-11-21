import 'package:flutter/material.dart';

class CustomText {
  //H1

  static TextStyle h1(BuildContext context, Color textColor) {
    double currentHeight = MediaQuery.of(context).size.height;
    return TextStyle(
      fontSize: currentHeight * 0.06,
      color: textColor,
    );
  }

  //H2

  static TextStyle h2(BuildContext context, Color textColor) {
    double currentHeight = MediaQuery.of(context).size.height;
    return TextStyle(
      fontSize: currentHeight * 0.035,
      color: textColor,
      fontWeight: FontWeight.w600,
    );
  }

  //H4

  static TextStyle h4(BuildContext context, Color textColor) {
    double currentHeight = MediaQuery.of(context).size.height;
    return TextStyle(
      fontSize: currentHeight * 0.025,
      color: textColor,
      fontWeight: FontWeight.bold,
    );
  }

  //H5

  static TextStyle h5(BuildContext context, Color textColor) {
    double currentHeight = MediaQuery.of(context).size.height;
    return TextStyle(
      fontSize: currentHeight * 0.02,
      color: textColor,
      fontWeight: FontWeight.bold,
    );
  }
}
