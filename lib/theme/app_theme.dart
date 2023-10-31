import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter_clone/theme/palette.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Palette.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 52, 41, 41),
      elevation: 0,
    ),
    textTheme: GoogleFonts.robotoTextTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Palette.blueColor,
    ),
  );
}
