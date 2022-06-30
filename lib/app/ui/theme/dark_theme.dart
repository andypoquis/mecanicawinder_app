import 'package:flutter/material.dart';

import 'color.dart';

final ThemeData appThemeData = ThemeData(
  useMaterial3: true,
  primarySwatch: primaryColor,
  primaryColor: const Color(0xff6750A4),
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);
