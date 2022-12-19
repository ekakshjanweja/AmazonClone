import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/custom_text.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
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

  final TextEditingController _emailControlller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  //Auth Service

  final AuthService authService = AuthService();

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

  //Sign Up User

  void signUpUser() {
    authService.signUpUser(
      email: _emailControlller.text,
      password: _passwordController.text,
      name: _nameController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              //Welcome Text

              Text(
                'Welcome',
                style: CustomText.h2(
                  context,
                  GlobalVariables.blackColor,
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              //Create Account

              Container(
                decoration: BoxDecoration(
                  color: GlobalVariables.backgroundColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                  children: [
                    //Create Account Radio Button

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
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            //Email TextField

                            CustomTextField(
                              controller: _emailControlller,
                              hintText: 'Email',
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),

                            //Name TextField

                            CustomTextField(
                              controller: _nameController,
                              hintText: 'Name',
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),

                            //Password TextField

                            CustomTextField(
                              controller: _passwordController,
                              hintText: 'Password',
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),

                            //Sign Up Button

                            CustomButton(
                              buttonText: 'Sign Up',
                              onPressed: () {
                                if (_signUpFormKey.currentState!.validate()) {
                                  signUpUser();
                                }
                              },
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              //Sign In

              Container(
                decoration: BoxDecoration(
                  color: GlobalVariables.backgroundColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                  children: [
                    //Sign In Radio Button

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

                    //Sign In Form

                    if (_auth == Auth.signIn)
                      Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            //Email TextField

                            CustomTextField(
                              controller: _emailControlller,
                              hintText: 'Email',
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),

                            //Password TextField

                            CustomTextField(
                              controller: _nameController,
                              hintText: 'Password',
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),

                            //Sign Up Button

                            CustomButton(
                              buttonText: 'Sign Up',
                              onPressed: () {},
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
