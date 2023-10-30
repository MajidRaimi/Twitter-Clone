import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/features/auth/view/pages/pages.dart';
import 'package:twitter_clone/features/auth/view/widgets/widgets.dart';
import 'package:twitter_clone/theme/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                AuthField(
                  controller: _emailController,
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 18.h,
                ),
                AuthField(
                  controller: _passwordController,
                  isPassword: true,
                  hintText: 'Password',
                ),
                SizedBox(
                  height: 32.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RoundedCustomButton(
                    onTap: () {},
                    label: 'Sign Up',
                    backgroundColor: Palette.whiteColor,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: Palette.whiteColor,
                      fontSize: 12.sp,
                    ),
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Palette.blueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                                context,
                                LoginPage.route(),
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
