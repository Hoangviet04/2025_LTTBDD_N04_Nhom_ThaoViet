import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF39c3b9);
const Color secondaryColor = Colors.grey;

final ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
);
