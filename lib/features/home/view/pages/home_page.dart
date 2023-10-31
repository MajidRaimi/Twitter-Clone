import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/custom_app_bar.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/home/view/widgets/bottom_bar_items.dart';
import 'package:twitter_clone/features/home/view/widgets/widgets.dart';

final pageStateProvider = StateProvider<int>((ref) => 0);

class HomePage extends ConsumerWidget {
  static route() => MaterialPageRoute(builder: ((context) => const HomePage()));

  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onLogout() {
      ref.watch(authControllerProvider.notifier).logout(context);
    }

    void onPageChange(value) {
      ref.read(pageStateProvider.notifier).state = value;
    }

    return Scaffold(
        appBar: const CustomAppBar(),
        bottomNavigationBar: CupertinoTabBar(
          onTap: onPageChange,
          backgroundColor: Colors.transparent,
          items: bottomBarItems(ref.watch(pageStateProvider)),
        ),
        body: IndexedStack(
          index: ref.watch(pageStateProvider),
          children: bottomTabBarPages,
        ));
  }
}
