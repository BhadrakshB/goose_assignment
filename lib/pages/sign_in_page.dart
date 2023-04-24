import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/authentication_handler.dart';
import '../constants.dart';
import '../features/authentication.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: UIColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Let's get you in",
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 30.0),
            CustomButton(
                onTap: () async {
                  bool signedIn = await context.read<AuthenticationHandler>().signInGoogle();
                  signedIn ? Navigator.of(context).pushNamed('profile_settings_page') : null;
                },
                provider: SignInOptions.google),
            const SizedBox(height: 20.0),
            CustomButton(onTap: () {}, provider: SignInOptions.facebook),
            const SizedBox(height: 30.0),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 0.4,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("or"),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 0.4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            CustomButton(onTap: () {}, provider: SignInOptions.email),
            const SizedBox(height: 30.0),
            Text.rich(
              TextSpan(
                text: "Don't have an account? ",
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushNamed('sign_up_page');
                      },
                    text: "Sign Up",
                    style: TextStyle(
                      color: UIColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
