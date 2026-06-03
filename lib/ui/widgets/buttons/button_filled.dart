import 'package:flutter/material.dart';
import 'package:portfolio/ui/style/border_styles.dart';
import 'package:portfolio/ui/style/context_extensions.dart';
import 'package:portfolio/ui/style/sizes.dart';
import 'package:portfolio/ui/widgets/focus_border.dart';
import 'package:portfolio/ui/widgets/text/title_medium_text.dart';

class ButtonFilled extends StatelessWidget {
  const ButtonFilled({
    required this.label,
    this.onPressed,
    this.icon,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null;
    final backgroundColor = isEnabled
        ? context.appColors.onSurface
        : context.appColors.onSurface.withValues(alpha: 0.38);

    return Semantics(
      button: true,
      label: label,
      onTap: onPressed,
      enabled: isEnabled,
      excludeSemantics: true,
      child: FocusBorder(
        focusedColor: context.appColors.primary,
        onPressed: onPressed,
        enabled: isEnabled,
        child: GestureDetector(
          onTap: onPressed,
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: const .symmetric(
              horizontal: Sizes.large,
              vertical: Sizes.medium,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderStyles.br,
            ),
            child: Row(
              mainAxisSize: .min,
              mainAxisAlignment: .center,
              spacing: Sizes.small,
              children: [
                if (icon != null)
                  Icon(icon, size: 20, color: context.appColors.surface),
                TitleMediumText(
                  label,
                  color: context.appColors.surface,
                  textAlign: .center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
