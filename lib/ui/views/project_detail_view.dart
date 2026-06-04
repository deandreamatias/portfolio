import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/ui/notifiers/project_notifier.dart';
import 'package:portfolio/ui/style/context_extensions.dart';
import 'package:portfolio/ui/style/sizes.dart';
import 'package:portfolio/ui/views/projects_view.dart';
import 'package:portfolio/ui/views/section_placeholder_view.dart';
import 'package:portfolio/ui/widgets/breadcrumb/breadcrumb.dart';
import 'package:portfolio/ui/widgets/buttons/button_filled.dart';
import 'package:portfolio/ui/widgets/image_with_placeholder.dart';
import 'package:portfolio/ui/widgets/layout_base.dart';
import 'package:portfolio/ui/widgets/showcase_period/showcase_period_label.dart';
import 'package:portfolio/ui/widgets/text/body_large_text.dart';

class ProjectDetailView extends StatefulWidget {
  const ProjectDetailView({required this.id, super.key});

  final String id;

  @override
  State<ProjectDetailView> createState() => _ProjectDetailViewState();
}

class _ProjectDetailViewState extends State<ProjectDetailView> {
  late final ProjectNotifier projectNotifier;

  @override
  void initState() {
    super.initState();
    projectNotifier = ProjectNotifier(null);
    projectNotifier.loadProjectById(widget.id);
  }

  @override
  void dispose() {
    projectNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    return ValueListenableBuilder(
      valueListenable: projectNotifier,
      builder: (context, project, _) {
        if (project == null) {
          return SectionPlaceholderView(
            title: l10n.navProjects,
            message: l10n.sectionComingSoon(l10n.navProjects),
          );
        }
        return LayoutBase(
          child: Column(
            crossAxisAlignment: .start,
            spacing: Sizes.medium,
            children: [
              Breadcrumb(
                segments: [
                  BreadcrumbSegment(
                    label: l10n.navProjects,
                    onPressed: () => context.go(ProjectsView.route),
                    semanticsLabel: l10n.navProjects,
                  ),
                  BreadcrumbSegment(label: project.name),
                ],
              ),
              ShowcasePeriodLabel.fromShowcase(project),
              BodyLargeText(
                project.description,
                color: context.appColors.onSurface,
                textAlign: TextAlign.center,
              ),
              if (project.availableInStores)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: Sizes.medium,
                  children: [
                    ButtonFilled(
                      label: 'Google Play',
                      onPressed: () {
                        _launchUrl(project.web?.toString() ?? '');
                      },
                    ),
                    ButtonFilled(
                      label: 'App Store',
                      onPressed: () {
                        _launchUrl(project.web?.toString() ?? '');
                      },
                    ),
                  ],
                ),
              ImageWithPlaceholder(uri: project.logo ?? Uri()),
            ],
          ),
        );
      },
    );
  }

  Future<void> _launchUrl(String url) async {
    // TODO: Implement URL launcher functionality
    debugPrint('Opening URL: $url');
  }
}
