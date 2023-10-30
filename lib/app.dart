import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/auth/view/pages/pages.dart';
import 'package:twitter_clone/features/home/view/pages/home_page.dart';
import 'package:twitter_clone/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: AppTheme.theme,
          debugShowCheckedModeBanner: false,
          home: Consumer(
            builder: (
              context,
              ref,
              child,
            ) {
              final currentUserAccount = ref.watch(currentUserAccountProvider);
              return currentUserAccount.when(
                data: (user) {
                  if (user == null) return const LoginPage();
                  return const HomePage();
                },
                loading: () => const LoadingPage(),
                error: (e, s) => ErrorPage(
                  text: e.toString(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
