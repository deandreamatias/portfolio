import 'package:flutter/widgets.dart';
import 'package:portfolio/style/sizes.dart';
import 'package:portfolio/widgets/home/home_navigation_button.dart';
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
      tiles.add(
        Expanded(
          child: HomeNavigationButton(
            label: options[i].label,
            onPressed: () => onNavigate,
          ),
        ),
      );
    }
    return Row(spacing: Sizes.extraLarge, children: tiles);
  }
}
