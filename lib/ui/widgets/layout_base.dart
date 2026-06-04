import 'package:flutter/widgets.dart';
import 'package:portfolio/ui/style/border_styles.dart';
import 'package:portfolio/ui/style/context_extensions.dart';
import 'package:portfolio/ui/style/sizes.dart';
import 'package:portfolio/ui/widgets/brand_name.dart';

class LayoutBase extends StatelessWidget {
  const LayoutBase({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.appColors.surface,
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: Column(
              crossAxisAlignment: .start,
              children: <Widget>[
                const SizedBox(height: Sizes.large),
                Semantics(
                  header: true,
                  child: const Center(child: BrandName()),
                ),
                const SizedBox(height: Sizes.medium),
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.appColors.surfaceContainerLow,
                      borderRadius: BorderStyles.brTop,
                    ),
                    child: Padding(
                      padding: const .symmetric(
                        horizontal: Sizes.medium,
                        vertical: Sizes.medium,
                      ),
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
