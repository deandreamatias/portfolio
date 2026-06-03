import 'package:flutter/widgets.dart';
import 'package:portfolio/ui/style/border_styles.dart';
import 'package:portfolio/ui/style/context_extensions.dart';
import 'package:portfolio/ui/style/sizes.dart';
import 'package:portfolio/ui/widgets/focus_border.dart';
import 'package:portfolio/ui/widgets/text/headline_small_text.dart';

class HomeNavigationButton extends StatelessWidget {
  const HomeNavigationButton({
    super.key,
    required this.label,
    this.semanticLabel = '',
    this.onPressed,
  });

  final String label;
  final String semanticLabel;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel.isNotEmpty ? semanticLabel : label,
      onTap: onPressed,
      enabled: onPressed != null,
      child: ClipRRect(
        borderRadius: BorderStyles.brTop,
        child: FocusBorder(
          focusedColor: context.appColors.onSecondaryContainer,
          enabled: onPressed != null,
          onPressed: onPressed,
          child: GestureDetector(
            onTap: onPressed,
            child: ColoredBox(
              color: context.appColors.surfaceContainerHigh,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.medium,
                  vertical: Sizes.large,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: HeadlineSmallText(
                    label,
                    color: context.appColors.onSecondaryContainer,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
