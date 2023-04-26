import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:goose_flutter_assignment/Providers/sign_up_handler.dart';
import 'package:goose_flutter_assignment/constants.dart';
import 'package:provider/provider.dart';

class UserDetailsTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  const UserDetailsTextField(
      {Key? key,
      required this.label,
      this.isPassword = false,
      required this.hintText,
      required this.controller})
      : super(key: key);

  @override
  _UserDetailsTextFieldState createState() => _UserDetailsTextFieldState();
}

class _UserDetailsTextFieldState extends State<UserDetailsTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label,
              style: TextStyle(
                color: Colors.white,
              )),
          TextField(
            onChanged: (value) {
              log(value);
              switch (widget.label) {
                case "Username":
                  context.read<SignUpHandler>().setUsername(value);
                  break;

                case "Email":
                  context.read<SignUpHandler>().setEmail(value);
                  break;

                case "Password":
                  context.read<SignUpHandler>().setPassword(value);
                  break;

                case "Confirm Password":
                  context.read<SignUpHandler>().confirmPassword(value);
                  break;

                default:
              }
            },
            controller: widget.controller,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: () => setState(() {
                          showPassword = !showPassword;
                        }),
                        child: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: UIColors.primaryColor,
                        ),
                      )
                    : null,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: UIColors.primaryColor
                      .withOpacity(!widget.isPassword ? 0.2 : 1.0),
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: UIColors.primaryColor,
                )),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: UIColors.secondaryColor,
                )),
            obscureText: widget.isPassword && !showPassword,
            obscuringCharacter: '*',
          ),
        ],
      ),
    );
  }
}

class RememberMe extends StatefulWidget {
  final String label;
  final Color selectedColor;
  final Color unselectedColor;
  RememberMe(
      {Key? key,
      required this.label,
      required this.selectedColor,
      required this.unselectedColor})
      : super(key: key);

  @override
  _RememberMeState createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Checkbox(
              side: BorderSide(
                color: Colors.white,
              ),
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              activeColor: widget.selectedColor,
              checkColor: widget.selectedColor,
              value: isChecked,
              onChanged: ((value) {
                setState(() {
                  log(value.toString());
                  isChecked = value;
                });
              }),
            ),
            isChecked!
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  )
                : const SizedBox(height: 0.0)
          ],
        ),
        const SizedBox(width: 10.0),
        Text(
          widget.label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  final double width;
  final List<Color> gradientColors;
  final double fillFraction;
  const CustomProgressBar(
      {Key? key,
      required this.width,
      required this.gradientColors,
      required this.fillFraction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        return Stack(
          children: [
            Container(
              height: 15,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10000),
                color: UIColors.secondaryColor,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 15,
              width: fillFraction * width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10000),
                gradient: LinearGradient(colors: gradientColors),
              ),
            ),
          ],
        );
      },
    );
  }
}
