import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/context_extensions.dart';
import 'package:portfolio/shared/navigate_links.dart';
import 'package:portfolio/shared/sizes.dart';
import 'package:portfolio/widgets/text/body_large_text.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({required this.label, required this.url, super.key});

  final String label;
  final Uri url;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => openLink(url),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.medium,
              vertical: Sizes.small,
            ),
            child: BodyLargeText(
              label,
              textAlign: TextAlign.center,
              style: context.appTextStyles.bodyLarge.copyWith(
                color: context.appColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: context.appColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
