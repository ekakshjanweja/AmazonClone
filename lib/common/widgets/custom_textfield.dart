// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/constants/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone/constants/global_variables.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalVariables.greyBackgroundColor,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: CustomText.h5(context, Colors.black54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * 0.01),
            borderSide: BorderSide(
              color: GlobalVariables.blackColor.withOpacity(0.5),
            ),
          ),
        ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Enter your $hintText';
          }
          return null;
        },
      ),
    );
  }
}
