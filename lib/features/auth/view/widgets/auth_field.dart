import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twitter_clone/theme/theme.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.controller,
    this.isPassword = false,
    required this.hintText,
    this.regex,
    this.errorMessage = 'please check your input',
  });

  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final String? regex;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        } else if (regex != null && !RegExp(regex!).hasMatch(value)) {
          return errorMessage;
        }
        return null;
      },
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(
        color: Palette.whiteColor,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(
            color: Palette.blueColor,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(
            color: Palette.greyColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(
            color: Palette.greyColor,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.all(22),
      ),
    );
  }
}
