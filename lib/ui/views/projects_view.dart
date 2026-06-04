import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/ui/notifiers/showcase_notifier.dart';
import 'package:portfolio/ui/style/sizes.dart';
import 'package:portfolio/ui/views/career_view.dart';
import 'package:portfolio/ui/widgets/breadcrumb/breadcrumb.dart';
import 'package:portfolio/ui/widgets/buttons/button_transparent.dart';
import 'package:portfolio/ui/widgets/layout_base.dart';
import 'package:portfolio/ui/widgets/projects/projects_grid.dart';
import 'package:unicons/unicons.dart';

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
    return LayoutBase(
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Breadcrumb(segments: [BreadcrumbSegment(label: l10n.navProjects)]),
          const SizedBox(height: Sizes.large),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: showcaseNotifier,
              builder: (context, value, child) =>
                  ProjectsGrid(showcases: value),
            ),
          ),
          Center(
            child: ButtonTransparent(
              label: l10n.navCareer,
              icon: UniconsLine.angle_right,
              onPressed: () => context.go(CareerView.route),
            ),
          ),
        ],
      ),
    );
  }
}
