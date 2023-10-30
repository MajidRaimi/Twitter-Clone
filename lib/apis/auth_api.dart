import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/failure.dart';
import 'package:twitter_clone/core/providers.dart';
import 'package:twitter_clone/core/type_defs.dart';

final authAPIProvider = Provider<AuthAPI>((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthAPI(account: account);
});

/*
? When trying to sign up, want to get user account -> Account object
* want to access User related data -> User object
*/

abstract class IAuthAPI {
  FutureEither<User> signUp({
    required String email,
    required String password,
  });
}

class AuthAPI implements IAuthAPI {
  AuthAPI({required Account account}) : _account = account;

  final Account _account;

  @override
  FutureEither<User> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      return right(account);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(
          e.message ?? 'error-occurred',
          st.toString(),
        ),
      );
    } catch (e, st) {
      return left(
        Failure(
          e.toString(),
          st.toString(),
        ),
      );
    }
  }
}
