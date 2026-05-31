import 'package:flutter/widgets.dart';
import 'package:portfolio/style/context_extensions.dart';
import 'package:portfolio/style/sizes.dart';
import 'package:unicons/unicons.dart';

class NextSectionButton extends StatelessWidget {
  const NextSectionButton({
    required this.label,
    required this.onTap,
    super.key,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.medium),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    label,
                    style: context.appTextStyles.headlineSmall.copyWith(
                      color: context.appColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: Sizes.extraSmall),
                  Icon(
                    UniconsLine.angle_right,
                    color: context.appColors.onSurface,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
