import 'package:flutter/material.dart';
import 'package:portfolio/shared/sizes.dart';
import 'package:portfolio/widgets/home/atoms/home_navigation_label.dart';
import 'package:portfolio/widgets/home/models/home_navigation_option.dart';

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
      if (i > 0) {
        tiles.add(const SizedBox(width: Sizes.extraExtraLarge));
      }
      tiles.add(
        Expanded(
          child: _NavigationTile(option: options[i], onNavigate: onNavigate),
        ),
      );
    }
    return Row(children: tiles);
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
        child: Material(
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Sizes.extraLarge),
            topRight: Radius.circular(Sizes.extraLarge),
          ),
          child: InkWell(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Sizes.extraLarge),
              topRight: Radius.circular(Sizes.extraLarge),
            ),
            onTap: () => onNavigate(option.route),
            child: Center(
              child: HomeNavigationLabel(
                label: option.label,
                isSelected: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
