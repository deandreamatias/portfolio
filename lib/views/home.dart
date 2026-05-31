import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/style/context_extensions.dart';
import 'package:portfolio/style/sizes.dart';
import 'package:portfolio/views/about_view.dart';
import 'package:portfolio/views/career_view.dart';
import 'package:portfolio/views/contact_view.dart';
import 'package:portfolio/views/projects_view.dart';
import 'package:portfolio/widgets/home/home_desktop_navigation_tiles.dart';
import 'package:portfolio/widgets/home/home_hero.dart';
import 'package:portfolio/widgets/home/home_mobile_navigation_swipe.dart';
import 'package:portfolio/widgets/home/models/home_navigation_option.dart';

class HomeView extends StatelessWidget {
  static const String route = '/';

  const HomeView({super.key});

  void _navigateTo(BuildContext context, String route) {
    context.go(route);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final List<HomeNavigationOption> options = <HomeNavigationOption>[
      HomeNavigationOption(label: l10n.navProjects, route: ProjectsView.route),
      HomeNavigationOption(label: l10n.navCareer, route: CareerView.route),
      HomeNavigationOption(label: l10n.navAboutMe, route: AboutView.route),
      HomeNavigationOption(label: l10n.navContact, route: ContactView.route),
    ];

    return ColoredBox(
      color: context.appColors.surface,
      child: context.isMedium
          ? SafeArea(
              bottom: false,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1280),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: Sizes.large,
                      right: Sizes.large,
                      top: Sizes.large,
                    ),
                    child: _DesktopLayout(
                      options: options,
                      onNavigate: (String r) => _navigateTo(context, r),
                    ),
                  ),
                ),
              ),
            )
          : SafeArea(
              bottom: false,
              child: _MobileLayout(
                options: options,
                onNavigate: (String r) => _navigateTo(context, r),
              ),
            ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout({required this.options, required this.onNavigate});

  final List<HomeNavigationOption> options;
  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Expanded(child: Center(child: HomeHero())),
        HomeDesktopNavigationTiles(options: options, onNavigate: onNavigate),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({required this.options, required this.onNavigate});

  final List<HomeNavigationOption> options;
  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.extraLarge),
              child: const HomeHero(),
            ),
          ),
        ),
        HomeMobileNavigationSwipe(options: options, onNavigate: onNavigate),
      ],
    );
  }
}
