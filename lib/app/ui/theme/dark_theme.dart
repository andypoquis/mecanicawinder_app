import 'package:flutter/material.dart';

import 'color.dart';

final ThemeData appThemeData = ThemeData(
  useMaterial3: true,
  primarySwatch: primaryColor,
  primaryColor: const Color(0xff7E3FF2),
  fontFamily: 'Georgia',
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);
