import 'package:flutter/widgets.dart';
import 'package:portfolio/style/sizes.dart';

class BorderStyles {
  static const Radius radius = Radius.circular(Sizes.small);
  static const BorderRadius br = BorderRadius.all(radius);
  static const BorderRadius brTop = BorderRadius.vertical(top: radius);
  static const BorderRadius brBottom = BorderRadius.vertical(bottom: radius);
  static const BorderRadius brLeft = BorderRadius.horizontal(left: radius);
  static const BorderRadius brRight = BorderRadius.horizontal(right: radius);
}
