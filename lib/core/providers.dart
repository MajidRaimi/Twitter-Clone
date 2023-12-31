import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/constants/appwrite_constants.dart';

final appwriteClientProvider = Provider<Client>(
  (ref) {
    Client client = Client();
    return client
        .setEndpoint(AppwriteConstants.endPoint)
        .setProject(AppwriteConstants.projectId)
        .setSelfSigned(status: true);
  },
);

final appwriteAccountProvider = Provider<Account>(
  (ref) => Account(
    ref.watch(appwriteClientProvider),
  ),
);

final appwriteDatabasesProvider = Provider<Databases>(
  (ref) => Databases(
    ref.watch(appwriteClientProvider),
  ),
);
