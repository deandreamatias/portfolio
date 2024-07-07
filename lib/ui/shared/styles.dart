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
    primaryContainer: Colors.orange,
    secondaryContainer: Colors.deepOrange,
    surface: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  ),
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
      backgroundColor: WidgetStateProperty.all<Color>(accent),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.all(16.0),
      ),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
  ),
);
