import 'package:flutter/material.dart';

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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Text(
      label,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: isSelected
            ? colorScheme.onSecondaryContainer
            : colorScheme.onSurface,
      ),
    );
  }
}
