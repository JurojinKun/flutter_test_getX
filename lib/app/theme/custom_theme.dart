import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_getx/app/theme/custom_font_sizes.dart';

class CustomTheme {
  static Color primaryColor = const Color(0xFFee1515),
      white = const Color(0xFFfbfbfb),
      black = const Color(0xFF222224),
      transparent = Colors.transparent;

  static final lightTheme = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: white,
    indicatorColor: black,
    useMaterial3: true,
    fontFamily: "PokemonSolid",
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: white,
      scrolledUnderElevation: 0,
      titleTextStyle:
          FontSizes.textStyleCustomPokemonSolid(black, FontSizes.titleAppBar),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.all(
          FontSizes.textStyleCustomPokemonSolid(
              black.withOpacity(0.8), FontSizes.titleNavBar)),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: black,
    indicatorColor: white,
    useMaterial3: true,
    fontFamily: "PokemonSolid",
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: black,
      scrolledUnderElevation: 0,
      titleTextStyle:
          FontSizes.textStyleCustomPokemonSolid(white, FontSizes.titleAppBar),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: black,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.all(
          FontSizes.textStyleCustomPokemonSolid(
              white.withOpacity(0.8), FontSizes.titleNavBar)),
    ),
  );
}
