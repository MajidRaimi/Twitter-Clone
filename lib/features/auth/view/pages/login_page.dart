import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fzregex/utils/pattern.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/auth/view/widgets/widgets.dart';
import 'package:twitter_clone/theme/theme.dart';

import '../../../../common/loading_page.dart';
import './pages.dart';

class LoginPage extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );

  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void onLogin() {
    if (!_formKey.currentState!.validate()) return;

    ref.read(authControllerProvider.notifier).login(
          email: _emailController.text,
          password: _passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: isLoading
          ? const Loader()
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AuthField(
                          controller: _emailController,
                          hintText: 'Email',
                          regex: FzPattern.email.toString(),
                          errorMessage: 'please enter a valid email',
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
                            onTap: onLogin,
                            label: 'Login',
                            isLoading: ref.read(authControllerProvider),
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
                                text: 'Sign Up',
                                style: TextStyle(
                                  color: Palette.blueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                        context,
                                        SignUpPage.route(),
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
            ),
    );
  }
}
