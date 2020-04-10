import 'package:flutter/material.dart';

const Color PRIMARY = Color(0xFF222222);
const Color ACCENT = Color(0xFF7E008E);
const Color BACKGROUND = Color(0xFF333333);

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
    background: BACKGROUND,
    primaryVariant: Colors.orange,
    secondaryVariant: Colors.deepOrange,
    surface: Colors.white,
    onSurface: Colors.black,
    brightness: Brightness.dark,
  ),
  backgroundColor: BACKGROUND,
  primaryColorDark: PRIMARY,
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    color: BACKGROUND,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: BACKGROUND,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: PRIMARY
  ),
  cardTheme: const CardTheme(
    color:  PRIMARY,
    margin: EdgeInsets.all(12.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  ),
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
