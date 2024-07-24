import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff7c4e7e),
      surfaceTint: Color(0xff7c4e7e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffd6fc),
      onPrimaryContainer: Color(0xff310936),
      secondary: Color(0xff6c586a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff5dbf1),
      onSecondaryContainer: Color(0xff251626),
      tertiary: Color(0xff825249),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdad4),
      onTertiaryContainer: Color(0xff33110b),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffff7fa),
      onBackground: Color(0xff1f1a1f),
      surface: Color(0xfffff7fa),
      onSurface: Color(0xff1f1a1f),
      surfaceVariant: Color(0xffeddfe8),
      onSurfaceVariant: Color(0xff4d444c),
      outline: Color(0xff7f747c),
      outlineVariant: Color(0xffd0c3cc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff352f34),
      inverseOnSurface: Color(0xfff9eef4),
      inversePrimary: Color(0xffecb4eb),
      primaryFixed: Color(0xffffd6fc),
      onPrimaryFixed: Color(0xff310936),
      primaryFixedDim: Color(0xffecb4eb),
      onPrimaryFixedVariant: Color(0xff623765),
      secondaryFixed: Color(0xfff5dbf1),
      onSecondaryFixed: Color(0xff251626),
      secondaryFixedDim: Color(0xffd8bfd4),
      onSecondaryFixedVariant: Color(0xff534152),
      tertiaryFixed: Color(0xffffdad4),
      onTertiaryFixed: Color(0xff33110b),
      tertiaryFixedDim: Color(0xfff6b8ac),
      onTertiaryFixedVariant: Color(0xff673b33),
      surfaceDim: Color(0xffe2d7de),
      surfaceBright: Color(0xfffff7fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf0f7),
      surfaceContainer: Color(0xfff6ebf2),
      surfaceContainerHigh: Color(0xfff1e5ec),
      surfaceContainerHighest: Color(0xffebdfe6),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff5e3361),
      surfaceTint: Color(0xff7c4e7e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff946496),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4f3d4e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff836e81),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff62372f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9b685e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff7fa),
      onBackground: Color(0xff1f1a1f),
      surface: Color(0xfffff7fa),
      onSurface: Color(0xff1f1a1f),
      surfaceVariant: Color(0xffeddfe8),
      onSurfaceVariant: Color(0xff494048),
      outline: Color(0xff665c64),
      outlineVariant: Color(0xff827780),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff352f34),
      inverseOnSurface: Color(0xfff9eef4),
      inversePrimary: Color(0xffecb4eb),
      primaryFixed: Color(0xff946496),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff7a4c7b),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff836e81),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff695668),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff9b685e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff7f5047),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe2d7de),
      surfaceBright: Color(0xfffff7fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf0f7),
      surfaceContainer: Color(0xfff6ebf2),
      surfaceContainerHigh: Color(0xfff1e5ec),
      surfaceContainerHighest: Color(0xffebdfe6),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff39113e),
      surfaceTint: Color(0xff7c4e7e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5e3361),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2c1d2d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4f3d4e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3b1811),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff62372f),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff7fa),
      onBackground: Color(0xff1f1a1f),
      surface: Color(0xfffff7fa),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffeddfe8),
      onSurfaceVariant: Color(0xff292228),
      outline: Color(0xff494048),
      outlineVariant: Color(0xff494048),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff352f34),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffffe4fb),
      primaryFixed: Color(0xff5e3361),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff451c49),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4f3d4e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff382737),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff62372f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff48221b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe2d7de),
      surfaceBright: Color(0xfffff7fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf0f7),
      surfaceContainer: Color(0xfff6ebf2),
      surfaceContainerHigh: Color(0xfff1e5ec),
      surfaceContainerHighest: Color(0xffebdfe6),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffecb4eb),
      surfaceTint: Color(0xffecb4eb),
      onPrimary: Color(0xff49204d),
      primaryContainer: Color(0xff623765),
      onPrimaryContainer: Color(0xffffd6fc),
      secondary: Color(0xffd8bfd4),
      onSecondary: Color(0xff3c2b3b),
      secondaryContainer: Color(0xff534152),
      onSecondaryContainer: Color(0xfff5dbf1),
      tertiary: Color(0xfff6b8ac),
      onTertiary: Color(0xff4c251e),
      tertiaryContainer: Color(0xff673b33),
      onTertiaryContainer: Color(0xffffdad4),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff171216),
      onBackground: Color(0xffebdfe6),
      surface: Color(0xff171216),
      onSurface: Color(0xffebdfe6),
      surfaceVariant: Color(0xff4d444c),
      onSurfaceVariant: Color(0xffd0c3cc),
      outline: Color(0xff998d96),
      outlineVariant: Color(0xff4d444c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebdfe6),
      inverseOnSurface: Color(0xff352f34),
      inversePrimary: Color(0xff7c4e7e),
      primaryFixed: Color(0xffffd6fc),
      onPrimaryFixed: Color(0xff310936),
      primaryFixedDim: Color(0xffecb4eb),
      onPrimaryFixedVariant: Color(0xff623765),
      secondaryFixed: Color(0xfff5dbf1),
      onSecondaryFixed: Color(0xff251626),
      secondaryFixedDim: Color(0xffd8bfd4),
      onSecondaryFixedVariant: Color(0xff534152),
      tertiaryFixed: Color(0xffffdad4),
      onTertiaryFixed: Color(0xff33110b),
      tertiaryFixedDim: Color(0xfff6b8ac),
      onTertiaryFixedVariant: Color(0xff673b33),
      surfaceDim: Color(0xff171216),
      surfaceBright: Color(0xff3e373c),
      surfaceContainerLowest: Color(0xff120d11),
      surfaceContainerLow: Color(0xff1f1a1f),
      surfaceContainer: Color(0xff231e23),
      surfaceContainerHigh: Color(0xff2e282d),
      surfaceContainerHighest: Color(0xff393338),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff1b8f0),
      surfaceTint: Color(0xffecb4eb),
      onPrimary: Color(0xff2b0331),
      primaryContainer: Color(0xffb37fb3),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffdcc3d9),
      onSecondary: Color(0xff201120),
      secondaryContainer: Color(0xffa08a9e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffabcb0),
      onTertiary: Color(0xff2c0c07),
      tertiaryContainer: Color(0xffba8379),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff171216),
      onBackground: Color(0xffebdfe6),
      surface: Color(0xff171216),
      onSurface: Color(0xfffff9fa),
      surfaceVariant: Color(0xff4d444c),
      onSurfaceVariant: Color(0xffd4c7d0),
      outline: Color(0xffac9fa8),
      outlineVariant: Color(0xff8b8088),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebdfe6),
      inverseOnSurface: Color(0xff2e282d),
      inversePrimary: Color(0xff643866),
      primaryFixed: Color(0xffffd6fc),
      onPrimaryFixed: Color(0xff25002b),
      primaryFixedDim: Color(0xffecb4eb),
      onPrimaryFixedVariant: Color(0xff502653),
      secondaryFixed: Color(0xfff5dbf1),
      onSecondaryFixed: Color(0xff1a0c1b),
      secondaryFixedDim: Color(0xffd8bfd4),
      onSecondaryFixedVariant: Color(0xff423141),
      tertiaryFixed: Color(0xffffdad4),
      onTertiaryFixed: Color(0xff250704),
      tertiaryFixedDim: Color(0xfff6b8ac),
      onTertiaryFixedVariant: Color(0xff532b24),
      surfaceDim: Color(0xff171216),
      surfaceBright: Color(0xff3e373c),
      surfaceContainerLowest: Color(0xff120d11),
      surfaceContainerLow: Color(0xff1f1a1f),
      surfaceContainer: Color(0xff231e23),
      surfaceContainerHigh: Color(0xff2e282d),
      surfaceContainerHighest: Color(0xff393338),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9fa),
      surfaceTint: Color(0xffecb4eb),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xfff1b8f0),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9fa),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffdcc3d9),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9f8),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfffabcb0),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff171216),
      onBackground: Color(0xffebdfe6),
      surface: Color(0xff171216),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff4d444c),
      onSurfaceVariant: Color(0xfffff9fa),
      outline: Color(0xffd4c7d0),
      outlineVariant: Color(0xffd4c7d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebdfe6),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff421946),
      primaryFixed: Color(0xffffdcfb),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xfff1b8f0),
      onPrimaryFixedVariant: Color(0xff2b0331),
      secondaryFixed: Color(0xfff9dff5),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffdcc3d9),
      onSecondaryFixedVariant: Color(0xff201120),
      tertiaryFixed: Color(0xffffe0da),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfffabcb0),
      onTertiaryFixedVariant: Color(0xff2c0c07),
      surfaceDim: Color(0xff171216),
      surfaceBright: Color(0xff3e373c),
      surfaceContainerLowest: Color(0xff120d11),
      surfaceContainerLow: Color(0xff1f1a1f),
      surfaceContainer: Color(0xff231e23),
      surfaceContainerHigh: Color(0xff2e282d),
      surfaceContainerHighest: Color(0xff393338),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        cardTheme: CardTheme(
          color: colorScheme.secondaryContainer,
          shadowColor: colorScheme.shadow,
        ),
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
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

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
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

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
