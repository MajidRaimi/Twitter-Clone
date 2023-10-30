import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/custom_app_bar.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';

class HomePage extends ConsumerWidget {
  static route() => MaterialPageRoute(builder: ((context) => const HomePage()));

  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // create a function named onLogout
    // call ref.read(authControllerProvider.notifier).logout()

    void onLogout() {
      ref.watch(authControllerProvider.notifier).logout(context);
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: onLogout,
          child: const Text('Sign out'),
        ),
      ),
    );
  }
}
