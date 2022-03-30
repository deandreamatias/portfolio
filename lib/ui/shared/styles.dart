import 'package:flutter/material.dart';

const Color primary = Color(0xFF222222);
const Color accent = Color(0xFF7E008E);
const Color background = Color(0xFF333333);

final ThemeData themeDark = ThemeData(
  fontFamily: 'Asap',
  colorScheme: const ColorScheme(
    primary: primary,
    onPrimary: Colors.white,
    secondary: accent,
    error: Colors.red,
    onSecondary: Colors.white,
    onError: Colors.white,
    onBackground: Colors.black,
    background: background,
    primaryContainer: Colors.orange,
    secondaryContainer: Colors.deepOrange,
    surface: Colors.white,
    onSurface: Colors.black,
    brightness: Brightness.dark,
  ),
  backgroundColor: background,
  primaryColorDark: primary,
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    color: background,
  ),
  scaffoldBackgroundColor: background,
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: primary),
  cardTheme: const CardTheme(
    color: primary,
    margin: EdgeInsets.all(12.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  ),
  brightness: Brightness.dark,
  primaryColor: primary,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(accent),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(16.0),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
  ),
);
