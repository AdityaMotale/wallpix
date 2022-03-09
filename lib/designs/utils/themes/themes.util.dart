import 'package:flutter/material.dart';
import '../colors/dark.color.util.dart';
import '../colors/light.color.util.dart';

class ThemeUtil {
  static ThemeData lightTheme() => ThemeData(
      scaffoldBackgroundColor: LightColorUtil.bg,
      brightness: Brightness.light,
      textTheme: const TextTheme().apply(
        bodyColor: LightColorUtil.primery,
      ));

  static ThemeData darkTheme() => ThemeData(
    scaffoldBackgroundColor: DarkColorUtil.bg,
    brightness: Brightness.dark,
    textTheme: const TextTheme().apply(
      bodyColor: DarkColorUtil.primery,
    ),
  );
}