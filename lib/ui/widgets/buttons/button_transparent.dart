import 'package:flutter/widgets.dart';
import 'package:portfolio/ui/style/context_extensions.dart';
import 'package:portfolio/ui/style/sizes.dart';
import 'package:portfolio/ui/widgets/focus_border.dart';

class ButtonTransparent extends StatelessWidget {
  const ButtonTransparent({
    super.key,
    this.icon,
    this.semanticLabel = '',
    this.onPressed,
    this.padding = const EdgeInsets.all(Sizes.small),
    this.label = '',
  }) : assert(
         semanticLabel.length > 0 && icon != null || label.length > 0,
         'semanticLabel must not be empty',
       );

  final String label;
  final IconData? icon;
  final String semanticLabel;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null;
    final color = isEnabled
        ? context.appColors.secondary
        : context.appColors.secondary.withValues(alpha: 0.38);

    return Semantics(
      button: true,
      label: semanticLabel.isNotEmpty ? semanticLabel : label,
      onTap: onPressed,
      enabled: isEnabled,
      excludeSemantics: true,
      child: FocusBorder(
        focusedColor: context.appColors.secondary,
        onPressed: onPressed,
        enabled: isEnabled,
        child: GestureDetector(
          onTap: onPressed,
          behavior: .opaque,
          child: Padding(
            padding: padding,
            child: Row(
              mainAxisSize: .min,
              mainAxisAlignment: .center,
              spacing: Sizes.extraSmall,
              children: [
                if (label.isNotEmpty)
                  Text(
                    label,
                    style: context.appTextStyles.headlineSmall.copyWith(
                      color: color,
                    ),
                  ),
                if (icon != null) _Icon(icon: icon!, color: color),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 32, color: color);
  }
}
