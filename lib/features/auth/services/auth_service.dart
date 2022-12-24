import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //Sign up the user

  void signUpUser({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        type: '',
        token: '',
      );

      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
              context, 'Account created! Login with same credentials.');
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  //Sing in user

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.body);

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(
            'x-auth-token',
            jsonDecode(response.body)['token'],
          );
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
