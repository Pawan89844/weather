import 'package:flutter/material.dart';
import 'package:weather/style/app_colors.dart';
import 'package:weather/style/app_text_style.dart';

abstract class AppTheme {
  ThemeData selectedTheme();

  ThemeData lightTheme();

  ThemeData darkTheme();
}

class MyTheme extends AppColors with AppTextStyle implements AppTheme {
  AppBarTheme _appBarTheme() {
    return AppBarTheme(
        backgroundColor: super.appBarColor,
        centerTitle: true,
        titleTextStyle: super.appBarTextStyle());
  }

  ColorScheme _colorScheme() {
    return ColorScheme.fromSeed(
        seedColor: Colors.deepPurple, background: super.backgroundColor);
  }

  @override
  ThemeData darkTheme() {
    // TODO: implement darkTheme
    throw UnimplementedError();
  }

  @override
  ThemeData lightTheme() {
    // TODO: implement lightTheme
    throw UnimplementedError();
  }

  @override
  ThemeData selectedTheme() {
    return ThemeData(
      scaffoldBackgroundColor: super.backgroundColor,
      appBarTheme: _appBarTheme(),
      colorScheme: _colorScheme(),
      useMaterial3: true,
    );
  }
}
