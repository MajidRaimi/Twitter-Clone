import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth_api.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/features/home/view/pages/home_page.dart';
import 'package:twitter_clone/utils/utils.dart';

import '../view/pages/login_page.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) {
    final authAPI = ref.watch(authAPIProvider);
    return AuthController(authAPI);
  },
);

final currentUserAccountProvider = FutureProvider<User?>(
  (ref) {
    final authController = ref.watch(authControllerProvider.notifier);
    return authController.currentUserAccount();
  },
);

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  AuthController(AuthAPI authAPI)
      : _authAPI = authAPI,
        super(false);

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final response = await _authAPI.signUp(email: email, password: password);
    state = false;

    response.fold(
      (l) => showSnackBar(context: context, message: l.message),
      (r) {
        showSnackBar(
            context: context, message: 'Sign up successful, please login');
        Navigator.pop(context);
      },
    );
  }

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final response = await _authAPI.login(email: email, password: password);
    state = false;

    response.fold(
      (l) => showSnackBar(context: context, message: l.message),
      (r) => Navigator.pushReplacement(context, HomePage.route()),
    );
  }

  Future<User?> currentUserAccount() => _authAPI.currentUserAccount();

  FutureVoid logout(BuildContext context) async {
    await _authAPI.logout();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, LoginPage.route());
  }
}
