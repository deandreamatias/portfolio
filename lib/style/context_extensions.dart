import 'package:flutter/widgets.dart';
import 'package:portfolio/style/app_theme.dart';
import 'package:portfolio/style/breakpoints.dart';

extension MediaQueryExtension on BuildContext {
  double get width {
    final MediaQueryData? mediaQuery = MediaQuery.maybeOf(this);
    if (mediaQuery != null) {
      return mediaQuery.size.width;
    }
    final view = View.of(this);
    return view.physicalSize.width / view.devicePixelRatio;
  }

  double get height {
    final MediaQueryData? mediaQuery = MediaQuery.maybeOf(this);
    if (mediaQuery != null) {
      return mediaQuery.size.height;
    }
    final view = View.of(this);
    return view.physicalSize.height / view.devicePixelRatio;
  }

  // Breakpoints
  bool get isExtraExtraSmall => width < Breakpoints.extraSmall;
  bool get isExtraSmall => width < Breakpoints.small;
  bool get isSmall => width < Breakpoints.medium;
  bool get isMedium => width >= Breakpoints.medium;
  bool get isLarge => width >= Breakpoints.large;
  bool get isExtraLarge => width >= Breakpoints.extraLarge;
  bool get isExtraExtraLarge => width >= Breakpoints.extraExtraLarge;

  AppTypographyVariant get typographyVariant {
    if (isExtraExtraSmall || isExtraSmall) {
      return AppTypographyVariant.compact;
    }
    if (isExtraLarge || isExtraExtraLarge) {
      return AppTypographyVariant.expanded;
    }
    return AppTypographyVariant.regular;
  }
}

extension AppThemeExtension on BuildContext {
  AppThemeData get appTheme => AppTheme.of(this);
  AppColors get appColors => appTheme.colors;
  AppTextStyles get appTextStyles => appTheme.textStyles;
}
