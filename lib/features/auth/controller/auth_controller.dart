import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth_api.dart';
import 'package:twitter_clone/utils/utils.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) {
    final authAPI = ref.watch(authAPIProvider);
    return AuthController(authAPI);
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
      (r) => print(r.email),
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
      (r) => print(r.userId),
    );
  }
}
