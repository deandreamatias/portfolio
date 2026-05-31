import 'package:flutter/widgets.dart';
import 'package:portfolio/style/context_extensions.dart';
import 'package:portfolio/style/sizes.dart';
import 'package:portfolio/widgets/home/models/home_navigation_option.dart';
import 'package:portfolio/widgets/text/headline_small_text.dart';

class HomeDesktopNavigationTiles extends StatelessWidget {
  const HomeDesktopNavigationTiles({
    required this.options,
    required this.onNavigate,
    super.key,
  });

  final List<HomeNavigationOption> options;
  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tiles = <Widget>[];
    for (int i = 0; i < options.length; i++) {
      tiles.add(
        Expanded(
          child: _NavigationTile(option: options[i], onNavigate: onNavigate),
        ),
      );
    }
    return Row(spacing: Sizes.extraLarge, children: tiles);
  }
}

class _NavigationTile extends StatelessWidget {
  const _NavigationTile({required this.option, required this.onNavigate});

  final HomeNavigationOption option;
  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      child: Semantics(
        button: true,
        label: option.label,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Sizes.small),
            topRight: Radius.circular(Sizes.small),
          ),
          child: GestureDetector(
            onTap: () => onNavigate(option.route),
            child: ColoredBox(
              color: context.appColors.surfaceContainerHigh,
              child: Center(
                child: HeadlineSmallText(
                  option.label,
                  color: context.appColors.onSurface,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
