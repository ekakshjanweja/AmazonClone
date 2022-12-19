// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone/constants/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: GlobalVariables.secondaryColor,
        minimumSize: Size(
          double.infinity,
          MediaQuery.of(context).size.height * 0.08,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(MediaQuery.of(context).size.height * 0.01),
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: CustomText.h2(
          context,
          Colors.white,
        ),
      ),
    );
  }
}
