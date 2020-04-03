import 'package:flutter/material.dart';

const Color PRIMARY = Color(0xFF333333);
const Color ACCENT = Color(0xFF7E008E);

final ThemeData themeDark = ThemeData(
  fontFamily: 'Asap',
  colorScheme: ColorScheme(
    primary: PRIMARY,
    onPrimary: Colors.white,
    secondary: ACCENT,
    error: Colors.red,
    onSecondary: Colors.white,
    onError: Colors.white,
    onBackground: Colors.black,
    background: Colors.white,
    primaryVariant: Colors.orange,
    secondaryVariant: Colors.deepOrange,
    surface: Colors.white,
    onSurface: Colors.black,
    brightness: Brightness.dark,
  ),
  cardColor: const Color(0xFF222222),
  brightness: Brightness.dark,
  primaryColor: PRIMARY,
  accentColor: ACCENT,
  buttonColor: ACCENT,
  buttonTheme: const ButtonThemeData(
    buttonColor: ACCENT,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0))),
    textTheme: ButtonTextTheme.normal,
  ),
);
