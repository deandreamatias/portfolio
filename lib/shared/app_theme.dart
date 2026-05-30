import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/shared/theme.dart';

class AppColors {
  const AppColors({
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.primary,
    required this.onSurface,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.surface,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  factory AppColors.fromPalette(ThemePalette palette) {
    return AppColors(
      surfaceTint: palette.surfaceTint,
      onPrimary: palette.onPrimary,
      primaryContainer: palette.primaryContainer,
      onPrimaryContainer: palette.onPrimaryContainer,
      secondary: palette.secondary,
      onSecondary: palette.onSecondary,
      secondaryContainer: palette.secondaryContainer,
      primary: palette.primary,
      onSurface: palette.onSurface,
      onSecondaryContainer: palette.onSecondaryContainer,
      tertiary: palette.tertiary,
      onTertiary: palette.onTertiary,
      tertiaryContainer: palette.tertiaryContainer,
      onTertiaryContainer: palette.onTertiaryContainer,
      error: palette.error,
      onError: palette.onError,
      errorContainer: palette.errorContainer,
      onErrorContainer: palette.onErrorContainer,
      surface: palette.surface,
      onSurfaceVariant: palette.onSurfaceVariant,
      outline: palette.outline,
      outlineVariant: palette.outlineVariant,
      shadow: palette.shadow,
      scrim: palette.scrim,
      inverseSurface: palette.inverseSurface,
      inversePrimary: palette.inversePrimary,
      primaryFixed: palette.primaryFixed,
      onPrimaryFixed: palette.onPrimaryFixed,
      primaryFixedDim: palette.primaryFixedDim,
      onPrimaryFixedVariant: palette.onPrimaryFixedVariant,
      secondaryFixed: palette.secondaryFixed,
      onSecondaryFixed: palette.onSecondaryFixed,
      secondaryFixedDim: palette.secondaryFixedDim,
      onSecondaryFixedVariant: palette.onSecondaryFixedVariant,
      tertiaryFixed: palette.tertiaryFixed,
      onTertiaryFixed: palette.onTertiaryFixed,
      tertiaryFixedDim: palette.tertiaryFixedDim,
      onTertiaryFixedVariant: palette.onTertiaryFixedVariant,
      surfaceDim: palette.surfaceDim,
      surfaceBright: palette.surfaceBright,
      surfaceContainerLowest: palette.surfaceContainerLowest,
      surfaceContainerLow: palette.surfaceContainerLow,
      surfaceContainer: palette.surfaceContainer,
      surfaceContainerHigh: palette.surfaceContainerHigh,
      surfaceContainerHighest: palette.surfaceContainerHighest,
    );
  }

  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color primary;
  final Color onSurface;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color surface;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

class AppTextStyles {
  const AppTextStyles({
    required this.displayLarge,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
  });

  factory AppTextStyles.fromFonts({
    required String bodyFontString,
    required String displayFontString,
  }) {
    return AppTextStyles(
      displayLarge: GoogleFonts.getFont(
        displayFontString,
        fontSize: 57,
        fontWeight: FontWeight.w400,
        height: 64 / 57,
        letterSpacing: -0.25,
      ),
      headlineSmall: GoogleFonts.getFont(
        displayFontString,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 32 / 24,
      ),
      titleLarge: GoogleFonts.getFont(
        displayFontString,
        fontSize: 22,
        fontWeight: FontWeight.w400,
        height: 28 / 22,
      ),
      titleMedium: GoogleFonts.getFont(
        displayFontString,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 24 / 16,
        letterSpacing: 0.15,
      ),
      bodyLarge: GoogleFonts.getFont(
        bodyFontString,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.getFont(
        bodyFontString,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        letterSpacing: 0.25,
      ),
      bodySmall: GoogleFonts.getFont(
        bodyFontString,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
        letterSpacing: 0.4,
      ),
    );
  }

  final TextStyle displayLarge;
  final TextStyle headlineSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;

  AppTextStyles withColor(Color color) {
    return AppTextStyles(
      displayLarge: displayLarge.copyWith(color: color),
      headlineSmall: headlineSmall.copyWith(color: color),
      titleLarge: titleLarge.copyWith(color: color),
      titleMedium: titleMedium.copyWith(color: color),
      bodyLarge: bodyLarge.copyWith(color: color),
      bodyMedium: bodyMedium.copyWith(color: color),
      bodySmall: bodySmall.copyWith(color: color),
    );
  }
}

class AppThemeData {
  const AppThemeData({
    required this.brightness,
    required this.colors,
    required this.textStyles,
  });

  final Brightness brightness;
  final AppColors colors;
  final AppTextStyles textStyles;
}

class AppTheme extends InheritedWidget {
  const AppTheme({required this.data, required super.child, super.key});

  final AppThemeData data;

  static AppThemeData of(BuildContext context) {
    final AppTheme? inheritedTheme = context
        .dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(inheritedTheme != null, 'AppTheme not found in widget tree.');
    return inheritedTheme!.data;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) => oldWidget.data != data;
}

class AppThemeFactory {
  const AppThemeFactory._();

  static AppThemeData resolve({
    required Brightness brightness,
    required bool highContrast,
    required AppTextStyles textStyles,
  }) {
    final ThemePalette palette = switch ((brightness, highContrast)) {
      (Brightness.light, true) => ThemePalettes.lightHighContrast,
      (Brightness.light, false) => ThemePalettes.light,
      (Brightness.dark, true) => ThemePalettes.darkHighContrast,
      (Brightness.dark, false) => ThemePalettes.dark,
    };
    final AppColors colors = AppColors.fromPalette(palette);

    return AppThemeData(
      brightness: brightness,
      colors: colors,
      textStyles: textStyles.withColor(colors.onSurface),
    );
  }
}
