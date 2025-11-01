import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF39c3b9);
const Color secondaryColor = Colors.grey;

final ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(fontSize: 14, color: secondaryColor),
  ),

  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);

const EdgeInsets defaultPadding = EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 10,
);
const EdgeInsets defaultMargin = EdgeInsets.symmetric(horizontal: 16.0);
