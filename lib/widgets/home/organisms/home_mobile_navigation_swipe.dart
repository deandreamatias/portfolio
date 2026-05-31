import 'package:flutter/widgets.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/shared/context_extensions.dart';
import 'package:portfolio/shared/sizes.dart';
import 'package:portfolio/widgets/home/models/home_navigation_option.dart';
import 'package:portfolio/widgets/text/headline_small_text.dart';
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
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goToNext() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              // Left arrow — always occupies space to avoid layout shift
              SizedBox(
                width: 48,
                height: 160,
                child: hasPrevious
                    ? Semantics(
                        button: true,
                        label: l10n.homeNavigationPrevious,
                        child: _NavigationArrowButton(
                          icon: UniconsLine.angle_left,
                          semanticLabel: l10n.homeNavigationPrevious,
                          onPressed: _goToPrevious,
                        ),
                      )
                    : null,
              ),
              // Card — fills all remaining space
              Expanded(
                child: SizedBox(
                  height: 160,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.options.length,
                    onPageChanged: (int index) {
                      setState(() => _currentIndex = index);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final HomeNavigationOption option = widget.options[index];
                      return Semantics(
                        button: true,
                        label: option.label,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(Sizes.small),
                          ),
                          child: GestureDetector(
                            onTap: () => widget.onNavigate(option.route),
                            child: ColoredBox(
                              color: context.appColors.surfaceContainerHigh,
                              child: Center(
                                child: HeadlineSmallText(
                                  option.label,
                                  color: context.appColors.onSecondaryContainer,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Right arrow — always occupies space to avoid layout shift
              SizedBox(
                width: 48,
                height: 160,
                child: hasNext
                    ? Semantics(
                        button: true,
                        label: l10n.homeNavigationNext,
                        child: _NavigationArrowButton(
                          icon: UniconsLine.angle_right,
                          semanticLabel: l10n.homeNavigationNext,
                          onPressed: _goToNext,
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavigationArrowButton extends StatelessWidget {
  const _NavigationArrowButton({
    required this.icon,
    required this.semanticLabel,
    required this.onPressed,
  });

  final IconData icon;
  final String semanticLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Center(
          child: Icon(
            icon,
            size: 32,
            color: context.appColors.onSurface,
            semanticLabel: semanticLabel,
          ),
        ),
      ),
    );
  }
}
