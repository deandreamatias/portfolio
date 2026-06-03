import 'package:flutter/widgets.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/ui/style/sizes.dart';
import 'package:portfolio/ui/utils/accessibility_utils.dart';
import 'package:portfolio/ui/widgets/buttons/button_transparent.dart';
import 'package:portfolio/ui/widgets/home/home_navigation_button.dart';
import 'package:portfolio/ui/widgets/home/models/home_navigation_option.dart';
import 'package:unicons/unicons.dart';

class HomeMobileNavigationSwipe extends StatefulWidget {
  const HomeMobileNavigationSwipe({
    required this.options,
    required this.onNavigate,
    super.key,
  });

  final List<HomeNavigationOption> options;
  final ValueChanged<String> onNavigate;

  @override
  State<HomeMobileNavigationSwipe> createState() =>
      _HomeMobileNavigationSwipeState();
}

class _HomeMobileNavigationSwipeState extends State<HomeMobileNavigationSwipe> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPrevious() {
    if (_pageController.hasClients && _currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNext() {
    if (_pageController.hasClients &&
        _currentIndex < widget.options.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  String _getSemanticIndexText(AppLocalizations l10n, int index) {
    return l10n.homeNavigationPosition(
      (index + 1).toString(),
      widget.options.length.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final bool hasPrevious = _currentIndex > 0;
    final bool hasNext = _currentIndex < widget.options.length - 1;

    return Semantics(
      container: true,
      label: l10n.homeNavigationRegion,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            spacing: Sizes.small,
            children: <Widget>[
              ButtonTransparent(
                icon: UniconsLine.angle_left,
                semanticLabel: l10n.homeNavigationPrevious,
                onPressed: hasPrevious ? _goToPrevious : null,
              ),
              Expanded(
                child: SizedBox(
                  height: 160,
                  child: MergeSemantics(
                    child: Semantics(
                      slider: true,
                      container: true,
                      label: l10n.homeNavigationRegion,
                      onDecrease: hasPrevious ? _goToPrevious : null,
                      onIncrease: hasNext ? _goToNext : null,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: widget.options.length,
                        onPageChanged: (int index) {
                          setState(() => _currentIndex = index);
                          // Generates system vocalized screen announcements
                          AccessibilityUtils.announce(
                            context,
                            message: _getSemanticIndexText(l10n, index),
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          final HomeNavigationOption option =
                              widget.options[index];
                          final String posText = _getSemanticIndexText(
                            l10n,
                            index,
                          );
                          return HomeNavigationButton(
                            label: option.label,
                            semanticLabel: '$posText, ${option.label}',
                            onPressed: () => widget.onNavigate(option.route),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              ButtonTransparent(
                icon: UniconsLine.angle_right,
                semanticLabel: l10n.homeNavigationNext,
                onPressed: hasNext ? _goToNext : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
