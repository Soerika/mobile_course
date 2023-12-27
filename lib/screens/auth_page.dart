// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthcare_app/components/login_form.dart';
import 'package:healthcare_app/components/sign_up_form.dart';
import 'package:healthcare_app/components/social_button.dart';
import 'package:healthcare_app/utils/text.dart';

import '../utils/config.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignIn = true;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    //build login text field
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            height: Config.screenHeight,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  AppText.enText['welcome_text']!,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                Text(
                  // isSignIn
                  //     ? AppText.enText['signIn_text']!
                  //     : AppText.enText['register_text']!,
                  AppText.enText['signIn_text']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Config.spaceSmall,
                SizedBox(height: 50),
                isSignIn ? LoginForm() : SignUpForm(),
                // const LoginForm(),
                Config.spaceSmall,
                // isSignIn
                //     ? Center(
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppText.enText['forgot-password']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                // : Container(),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.grey.shade500,
                      endIndent: 5,
                    )),
                    Text(
                      AppText.enText['social-login']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.grey.shade500,
                      indent: 5,
                    )),
                  ],
                ),
                Config.spaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    SizedBox(
                      height: 55,
                      child: SocialButton(social: 'google'),
                    ),
                    SizedBox(
                      height: 55,
                      child: SocialButton(social: 'facebook'),
                    ),
                  ],
                ),
                Config.spaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      isSignIn ? AppText.enText['signUp_text'].toString() : AppText.enText['registered_text'].toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isSignIn=!isSignIn;
                        });
                      },
                      child: Text(
                        isSignIn?'Sign Up':'Sign In',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
