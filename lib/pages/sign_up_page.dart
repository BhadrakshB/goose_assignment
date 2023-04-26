import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/sign_up_handler.dart';
import '../constants.dart';
import '../features/authentication.dart';
import '../features/sign_up_features.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController usernameController;

  late TextEditingController emailController;

  late TextEditingController passwordController;

  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: UIColors.backgroundColor,
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Consumer<SignUpHandler>(
            builder: (context, value, child) => CustomProgressBar(
              fillFraction: value.progress
                      .where((element) => element == true)
                      .toList()
                      .length /
                  value.progress.length,
              width: 200,
              gradientColors: [
                UIColors.primaryColor.withAlpha(200),
                UIColors.primaryColor,
              ],
            ),
          )),
      backgroundColor: UIColors.backgroundColor,
      bottomNavigationBar: Container(
        width: double.infinity,
        color: UIColors.secondaryColor.withOpacity(0.25),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: CustomButton(
          label: "Continue",
          onTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0),
              const Text(
                "Create an Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 50.0),
              UserDetailsTextField(
                controller: usernameController,
                label: "Username",
                hintText: "Fun display name",
              ),
              UserDetailsTextField(
                controller: emailController,
                label: "Email",
                hintText: "abc@gmail.com",
              ),
              UserDetailsTextField(
                controller: passwordController,
                label: "Password",
                isPassword: true,
                hintText: "**********",
              ),
              UserDetailsTextField(
                  controller: confirmPasswordController,
                  label: "Confirm Password",
                  isPassword: true,
                  hintText: "**********"),
              const SizedBox(height: 10.0),
              RememberMe(
                label: "Remember Me",
                selectedColor: UIColors.primaryColor,
                unselectedColor: UIColors.secondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
