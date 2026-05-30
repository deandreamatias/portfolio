import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff7c4e7e),
      surfaceTint: Color(0xff7c4e7e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffd6fc),
      onPrimaryContainer: Color(0xff623765),
      secondary: Color(0xff6c586a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff5dbf1),
      onSecondaryContainer: Color(0xff534152),
      tertiary: Color(0xff8f4b3a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdad2),
      onTertiaryContainer: Color(0xff723425),
      error: Color(0xff904a43),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad5),
      onErrorContainer: Color(0xff73342d),
      surface: Color(0xfffff7fa),
      onSurface: Color(0xff1f1a1f),
      onSurfaceVariant: Color(0xff4d444c),
      outline: Color(0xff7f747c),
      outlineVariant: Color(0xffd0c3cc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff352f34),
      inversePrimary: Color(0xffecb4eb),
      primaryFixed: Color(0xffffd6fc),
      onPrimaryFixed: Color(0xff310936),
      primaryFixedDim: Color(0xffecb4eb),
      onPrimaryFixedVariant: Color(0xff623765),
      secondaryFixed: Color(0xfff5dbf1),
      onSecondaryFixed: Color(0xff251626),
      secondaryFixedDim: Color(0xffd8bfd4),
      onSecondaryFixedVariant: Color(0xff534152),
      tertiaryFixed: Color(0xffffdad2),
      onTertiaryFixed: Color(0xff3a0a02),
      tertiaryFixedDim: Color(0xffffb4a2),
      onTertiaryFixedVariant: Color(0xff723425),
      surfaceDim: Color(0xffe2d7de),
      surfaceBright: Color(0xfffff7fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf0f7),
      surfaceContainer: Color(0xfff6ebf2),
      surfaceContainerHigh: Color(0xfff0e5ec),
      surfaceContainerHighest: Color(0xffebdfe6),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff502653),
      surfaceTint: Color(0xff7c4e7e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff8c5c8e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff423141),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff7b6779),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5d2416),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa15947),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff5e231e),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffa25850),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff7fa),
      onSurface: Color(0xff151014),
      onSurfaceVariant: Color(0xff3c343b),
      outline: Color(0xff595057),
      outlineVariant: Color(0xff746a72),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff352f34),
      inversePrimary: Color(0xffecb4eb),
      primaryFixed: Color(0xff8c5c8e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff724474),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff7b6779),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff624f61),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffa15947),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff844232),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcec4ca),
      surfaceBright: Color(0xfffff7fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf0f7),
      surfaceContainer: Color(0xfff0e5ec),
      surfaceContainerHigh: Color(0xffe5dae1),
      surfaceContainerHighest: Color(0xffd9cfd5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff441b48),
      surfaceTint: Color(0xff7c4e7e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff653967),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff372737),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff564355),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff501b0d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff753727),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff511a15),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff76362f),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff7fa),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff322a31),
      outlineVariant: Color(0xff50464e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff352f34),
      inversePrimary: Color(0xffecb4eb),
      primaryFixed: Color(0xff653967),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff4c224f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff564355),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3e2d3e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff753727),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff592113),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc0b6bc),
      surfaceBright: Color(0xfffff7fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9eef4),
      surfaceContainer: Color(0xffebdfe6),
      surfaceContainerHigh: Color(0xffdcd1d8),
      surfaceContainerHighest: Color(0xffcec4ca),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
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
      tertiary: Color(0xffffb4a2),
      onTertiary: Color(0xff561f11),
      tertiaryContainer: Color(0xff723425),
      onTertiaryContainer: Color(0xffffdad2),
      error: Color(0xffffb4ab),
      onError: Color(0xff561e19),
      errorContainer: Color(0xff73342d),
      onErrorContainer: Color(0xffffdad5),
      surface: Color(0xff171216),
      onSurface: Color(0xffebdfe6),
      onSurfaceVariant: Color(0xffd0c3cc),
      outline: Color(0xff998d96),
      outlineVariant: Color(0xff4d444c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebdfe6),
      inversePrimary: Color(0xff7c4e7e),
      primaryFixed: Color(0xffffd6fc),
      onPrimaryFixed: Color(0xff310936),
      primaryFixedDim: Color(0xffecb4eb),
      onPrimaryFixedVariant: Color(0xff623765),
      secondaryFixed: Color(0xfff5dbf1),
      onSecondaryFixed: Color(0xff251626),
      secondaryFixedDim: Color(0xffd8bfd4),
      onSecondaryFixedVariant: Color(0xff534152),
      tertiaryFixed: Color(0xffffdad2),
      onTertiaryFixed: Color(0xff3a0a02),
      tertiaryFixedDim: Color(0xffffb4a2),
      onTertiaryFixedVariant: Color(0xff723425),
      surfaceDim: Color(0xff171216),
      surfaceBright: Color(0xff3e373d),
      surfaceContainerLowest: Color(0xff110d11),
      surfaceContainerLow: Color(0xff1f1a1f),
      surfaceContainer: Color(0xff231e23),
      surfaceContainerHigh: Color(0xff2e282d),
      surfaceContainerHighest: Color(0xff393338),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffccfd),
      surfaceTint: Color(0xffecb4eb),
      onPrimary: Color(0xff3d1541),
      primaryContainer: Color(0xffb37fb3),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffeed5ea),
      onSecondary: Color(0xff302030),
      secondaryContainer: Color(0xffa08a9e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd2c8),
      onTertiary: Color(0xff481408),
      tertiaryContainer: Color(0xffcb7c68),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff48130f),
      errorContainer: Color(0xffcc7b72),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff171216),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe6d8e2),
      outline: Color(0xffbbaeb7),
      outlineVariant: Color(0xff998d96),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebdfe6),
      inversePrimary: Color(0xff643866),
      primaryFixed: Color(0xffffd6fc),
      onPrimaryFixed: Color(0xff25002b),
      primaryFixedDim: Color(0xffecb4eb),
      onPrimaryFixedVariant: Color(0xff502653),
      secondaryFixed: Color(0xfff5dbf1),
      onSecondaryFixed: Color(0xff1a0c1b),
      secondaryFixedDim: Color(0xffd8bfd4),
      onSecondaryFixedVariant: Color(0xff423141),
      tertiaryFixed: Color(0xffffdad2),
      onTertiaryFixed: Color(0xff2a0400),
      tertiaryFixedDim: Color(0xffffb4a2),
      onTertiaryFixedVariant: Color(0xff5d2416),
      surfaceDim: Color(0xff171216),
      surfaceBright: Color(0xff494248),
      surfaceContainerLowest: Color(0xff0a060a),
      surfaceContainerLow: Color(0xff211c21),
      surfaceContainer: Color(0xff2c262b),
      surfaceContainerHigh: Color(0xff373136),
      surfaceContainerHighest: Color(0xff423c41),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffeafa),
      surfaceTint: Color(0xffecb4eb),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffe8b0e7),
      onPrimaryContainer: Color(0xff1b0020),
      secondary: Color(0xffffeafa),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd4bbd0),
      onSecondaryContainer: Color(0xff140615),
      tertiary: Color(0xffffece8),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffaf9b),
      onTertiaryContainer: Color(0xff1f0200),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220000),
      surface: Color(0xff171216),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfffaecf6),
      outlineVariant: Color(0xffccbfc8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebdfe6),
      inversePrimary: Color(0xff643866),
      primaryFixed: Color(0xffffd6fc),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffecb4eb),
      onPrimaryFixedVariant: Color(0xff25002b),
      secondaryFixed: Color(0xfff5dbf1),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd8bfd4),
      onSecondaryFixedVariant: Color(0xff1a0c1b),
      tertiaryFixed: Color(0xffffdad2),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb4a2),
      onTertiaryFixedVariant: Color(0xff2a0400),
      surfaceDim: Color(0xff171216),
      surfaceBright: Color(0xff554e54),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff231e23),
      surfaceContainer: Color(0xff352f34),
      surfaceContainerHigh: Color(0xff40393f),
      surfaceContainerHighest: Color(0xff4c454a),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
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
  );

  List<ExtendedColor> get extendedColors => [];
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
