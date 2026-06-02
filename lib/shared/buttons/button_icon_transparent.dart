// lib/shared/buttons/button_icon_transparent.dart

import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/utils/focus_border.dart';
import 'package:portfolio/style/context_extensions.dart';
import 'package:portfolio/style/sizes.dart';

class ButtonIconTransparent extends StatelessWidget {
  const ButtonIconTransparent({
    super.key,
    required this.icon,
    required this.semanticLabel,
    this.onPressed,
    this.padding = const EdgeInsets.all(Sizes.small),
  });

  final IconData icon;
  final String semanticLabel;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null;

    return Semantics(
      button: true,
      label: semanticLabel,
      onTap: onPressed,
      enabled: isEnabled,
      excludeSemantics: true,
      child: FocusBorder(
        focusedColor: context.appColors.onSurface,
        onPressed: onPressed,
        enabled: isEnabled,
        child: GestureDetector(
          onTap: onPressed,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: padding,
            child: Center(
              child: Icon(
                icon,
                size: 32,
                color: isEnabled
                    ? context.appColors.onSurface
                    : context.appColors.onSurface.withValues(alpha: 0.38),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
