import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/app_theme.dart';

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
  bool get isExtraExtraSmall => width < 256;
  bool get isExtraSmall => width < 512;
  bool get isSmall => width < 768;
  bool get isMedium => width >= 768;
  bool get isLarge => width >= 1024;
  bool get isExtraLarge => width >= 1440;
  bool get isExtraExtraLarge => width >= 2560;

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
