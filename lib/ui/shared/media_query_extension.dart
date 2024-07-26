import 'package:flutter/widgets.dart';

extension MediaQueryExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  // Breakpoints
  bool get isSmall => width < 600;
  bool get isMedium => width >= 600;
  bool get isLarge => width >= 1024;
  bool get isExtraLarge => width >= 1440;
  bool get isExtraExtraLarge => width >= 2560;
}
