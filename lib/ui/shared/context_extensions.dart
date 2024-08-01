import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension MediaQueryExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  // Breakpoints
  bool get isExtraExtraSmall => width < 256;
  bool get isExtraSmall => width < 512;
  bool get isSmall => width < 768;
  bool get isMedium => width >= 768;
  bool get isLarge => width >= 1024;
  bool get isExtraLarge => width >= 1440;
  bool get isExtraExtraLarge => width >= 2560;
}

extension ThemeExtension on BuildContext {
  TextTheme createTextTheme({
    required String bodyFontString,
    required String displayFontString,
  }) {
    TextTheme baseTextTheme = Theme.of(this).textTheme;
    TextTheme bodyTextTheme =
        GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
    TextTheme displayTextTheme =
        GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
    TextTheme textTheme = displayTextTheme.copyWith(
      bodyLarge: bodyTextTheme.bodyLarge,
      bodyMedium: bodyTextTheme.bodyMedium,
      bodySmall: bodyTextTheme.bodySmall,
      labelLarge: bodyTextTheme.labelLarge,
      labelMedium: bodyTextTheme.labelMedium,
      labelSmall: bodyTextTheme.labelSmall,
    );
    return textTheme;
  }
}
