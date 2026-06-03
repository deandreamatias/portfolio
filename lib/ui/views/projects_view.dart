import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/ui/notifiers/showcase_notifier.dart';
import 'package:portfolio/ui/style/border_styles.dart';
import 'package:portfolio/ui/style/context_extensions.dart';
import 'package:portfolio/ui/style/sizes.dart';
import 'package:portfolio/ui/views/career_view.dart';
import 'package:portfolio/ui/widgets/brand_name.dart';
import 'package:portfolio/ui/widgets/next_section_button.dart';
import 'package:portfolio/ui/widgets/projects/projects_grid.dart';
import 'package:portfolio/ui/widgets/text/title_large_text.dart';

class ProjectsView extends StatefulWidget {
  static const String route = '/projects';

  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  final ShowcaseNotifier showcaseNotifier = ShowcaseNotifier([]);

  @override
  void initState() {
    showcaseNotifier.loadProjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
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
                      child: Column(
                        mainAxisSize: .min,
                        crossAxisAlignment: .start,
                        children: [
                          Semantics(
                            header: true,
                            child: TitleLargeText(
                              l10n.navProjects,
                              color: context.appColors.onSurface,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: Sizes.large),
                          Expanded(
                            child: ValueListenableBuilder(
                              valueListenable: showcaseNotifier,
                              builder: (context, value, child) =>
                                  ProjectsGrid(showcases: value),
                            ),
                          ),
                          NextSectionButton(
                            label: l10n.navCareer,
                            onTap: () => context.go(CareerView.route),
                          ),
                        ],
                      ),
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
