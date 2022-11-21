import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/custom_text.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;

  //Text Editing Controller

  TextEditingController _emailControlller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  //Global Keys

  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailControlller.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Welcome Text

            Text(
              'Welcome',
              style: CustomText.h2(
                context,
                GlobalVariables.blackColor,
              ),
            ),

            //Create Account

            ListTile(
              title: Text(
                'Create Account',
                style: CustomText.h4(
                  context,
                  GlobalVariables.blackColor,
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signUp,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),

            //Create Account Form

            if (_auth == Auth.signUp)
              Form(
                key: _signUpFormKey,
                child: Column(
                  children: [
                    //Email TextField

                    CustomTextField(
                      controller: _emailControlller,
                      hintText: 'Email',
                    ),

                    //Name TextField

                    CustomTextField(
                      controller: _nameController,
                      hintText: 'Name',
                    )
                  ],
                ),
              ),

            //Sign In

            ListTile(
              title: Text(
                'Sign In',
                style: CustomText.h4(
                  context,
                  GlobalVariables.blackColor,
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signIn,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
