import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/constants/appwrite_constants.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/core/providers.dart';
import 'package:twitter_clone/models/user_model.dart';

final userAPIProvider = Provider<UserAPI>(
    (ref) => UserAPI(db: ref.watch(appwriteDatabasesProvider)));

abstract class IUserAPI {
  FutureEitherVoid saveUserData(UserModel user);
}

class UserAPI implements IUserAPI {
  final Databases _db;
  UserAPI({required Databases db}) : _db = db;

  @override
  FutureEitherVoid saveUserData(UserModel user) async {
    try {
      await _db.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.usersCollectionId,
        documentId: ID.unique(),
        data: user.toMap(),
      );
      return right(null);
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
