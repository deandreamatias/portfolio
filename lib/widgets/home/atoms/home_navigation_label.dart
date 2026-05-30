import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/context_extensions.dart';

class HomeNavigationLabel extends StatelessWidget {
  const HomeNavigationLabel({
    required this.label,
    required this.isSelected,
    super.key,
  });

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final Color textColor = isSelected
        ? context.appColors.onSecondaryContainer
        : context.appColors.onSurface;
    return Text(
      label,
      textAlign: TextAlign.center,
      style: context.appTextStyles.headlineSmall.copyWith(color: textColor),
    );
  }
}
