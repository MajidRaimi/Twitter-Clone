import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/features/auth/view/widgets/auth_field.dart';

import '../../../../theme/pallete.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
            ),
            child: Column(
              children: [
                // ! Email Text Field
                AuthField(
                  controller: _emailController,
                  hintText: 'Email',
                ),
                // ! Password Text Felid
                SizedBox(
                  height: 18.h,
                ),
                AuthField(
                  controller: _passwordController,
                  isPassword: true,
                  hintText: 'Password',
                ),
                // ! Sign up Button
                SizedBox(
                  height: 32.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RoundedCustomButton(
                    onTap: () {},
                    label: 'Login',
                    backgroundColor: Palette.whiteColor,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(
                      color: Palette.whiteColor,
                      fontSize: 12.sp,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          color: Palette.blueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pop(
                                context,
                              ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
