import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goose_flutter_assignment/constants.dart';

enum SignInOptions { google, facebook, email }

class CustomButton extends StatelessWidget {
  final SignInOptions? provider;
  final VoidCallback onTap;
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  const CustomButton({
    Key? key,
    this.provider,
    required this.onTap,
    this.label = "Continue",
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
          splashFactory: InkSplash.splashFactory,
          backgroundColor: provider == SignInOptions.email || provider == null
              ? UIColors.primaryColor
              : UIColors.secondaryColor,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
          ),
        ),
        child: provider != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  provider != SignInOptions.email
                      ? SvgPicture.asset(
                          "assets/svgs/${provider!.name}_logo.svg",
                          width: 25,
                          height: 25,
                        )
                      : const SizedBox(width: 0.0),
                  provider != SignInOptions.email
                      ? const SizedBox(width: 5.0)
                      : const SizedBox(width: 0.0),
                  Text(
                      "Sign in with ${provider!.name.toUpperCase().substring(0, 1)}${provider!.name.substring(1)}")
                ],
              )
            : Text(
                label,
                style: TextStyle(color: textColor),
              ),
      ),
    );
  }
}
