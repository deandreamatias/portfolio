import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/app_theme.dart';

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

extension AppThemeExtension on BuildContext {
  AppThemeData get appTheme => AppTheme.of(this);
  AppColors get appColors => appTheme.colors;
  AppTextStyles get appTextStyles => appTheme.textStyles;
}
