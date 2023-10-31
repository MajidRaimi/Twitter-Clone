import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth_api.dart';
import 'package:twitter_clone/apis/user_api.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/features/home/view/pages/home_page.dart';
import 'package:twitter_clone/models/user_model.dart';
import 'package:twitter_clone/utils/utils.dart';

import '../view/pages/login_page.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    authAPI: ref.watch(authAPIProvider),
    userAPI: ref.watch(userAPIProvider),
  ),
);

final currentUserAccountProvider = FutureProvider<User?>(
  (ref) {
    final authController = ref.watch(authControllerProvider.notifier);
    return authController.currentUserAccount();
  },
);

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  final UserAPI _userAPI;
  AuthController({required AuthAPI authAPI, required UserAPI userAPI})
      : _authAPI = authAPI,
        _userAPI = userAPI,
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
      (r) async {
        UserModel userModel =
            UserModel.empty().copyWith(email: r.email, name: r.name);

        final userResponse = await _userAPI.saveUserData(userModel);

        userResponse.fold(
          (l) => showSnackBar(context: context, message: l.message),
          (_) {
            showSnackBar(
                context: context, message: 'Sign up successful, please login');
            Navigator.pop(context);
          },
        );
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
