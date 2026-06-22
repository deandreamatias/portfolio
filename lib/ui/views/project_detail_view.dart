import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/data/file_service.dart';
import 'package:portfolio/data/models/job.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
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
  Project? _project;
  Job? _relatedJob;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final projectsResult = await const FileService().loadProjects();
    final projects = projectsResult.fold(
      (_) => <Project>[],
      (projects) => projects,
    );

    final project = projects.where((p) => p.id == widget.id).firstOrNull;
    Job? job;

    if (project != null && project.jobId.isNotEmpty) {
      final jobsResult = await const FileService().loadJobs();
      final jobs = jobsResult.fold(
        (_) => <Job>[],
        (jobs) => jobs,
      );
      job = jobs.where((j) => j.id == project.jobId).firstOrNull;
    }

    setState(() {
      _project = project;
      _relatedJob = job;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    if (_isLoading) {
      return const SizedBox.shrink();
    }

    if (_project == null) {
      return SectionPlaceholderView(
        title: l10n.navProjects,
        message: l10n.sectionComingSoon(l10n.navProjects),
      );
    }

    final links = <Widget>[];
    void addButton(String label, Uri? uri) {
      if (uri != null) {
        links.add(
          ButtonFilled(
            label: label,
            onPressed: () => _launchUrl(uri.toString()),
          ),
        );
      }
    }
    addButton('Google Play', _project!.links.googlePlay);
    addButton('App Store', _project!.links.appStore);
    addButton('Website', _project!.links.web);
    addButton('Repository', _project!.links.repository);

    return LayoutBase(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Sizes.medium,
        children: [
          Breadcrumb(
            segments: [
              BreadcrumbSegment(
                label: l10n.navProjects,
                onPressed: () => context.go(ProjectsView.route),
              ),
              if (_relatedJob != null)
                BreadcrumbSegment(
                  label: _relatedJob!.enterprise,
                  onPressed: () => context.go('/jobs/${_project!.jobId}'),
                ),
              BreadcrumbSegment(label: _project!.name),
            ],
          ),
          ShowcasePeriodLabel.fromShowcase(_project!),
          BodyLargeText(
            _project!.description,
            color: context.appColors.onSurface,
            textAlign: TextAlign.center,
          ),
          if (links.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: Sizes.medium,
              children: links,
            ),
          ImageWithPlaceholder(uri: _project!.logo ?? Uri()),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    // TODO: Implement URL launcher functionality
    debugPrint('Opening URL: $url');
  }
}
