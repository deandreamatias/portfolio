import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/data/file_service.dart';
import 'package:portfolio/data/models/job.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:portfolio/data/models/showcase.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/ui/style/context_extensions.dart';
import 'package:portfolio/ui/style/sizes.dart';
import 'package:portfolio/ui/utils/showcase_period_resolver.dart';
import 'package:portfolio/ui/views/projects_view.dart';
import 'package:portfolio/ui/views/section_placeholder_view.dart';
import 'package:portfolio/ui/widgets/breadcrumb/breadcrumb.dart';
import 'package:portfolio/ui/widgets/layout_base.dart';
import 'package:portfolio/ui/widgets/projects/projects_grid.dart';
import 'package:portfolio/ui/widgets/showcase_period/showcase_period_label.dart';
import 'package:portfolio/ui/widgets/text/body_large_text.dart';
import 'package:portfolio/ui/widgets/text/title_large_text.dart';

class JobDetailView extends StatefulWidget {
  const JobDetailView({required this.id, super.key});

  final String id;

  @override
  State<JobDetailView> createState() => _JobDetailViewState();
}

class _JobDetailViewState extends State<JobDetailView> {
  Job? _job;
  List<Showcase> _projects = const [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final jobsResult = await const FileService().loadJobs();
    final projectsResult = await const FileService().loadProjects();

    final jobs = jobsResult.fold(
      (_) => <Job>[],
      (jobs) => jobs,
    );
    final projects = projectsResult.fold(
      (_) => <Project>[],
      (projects) => projects,
    );

    final job = jobs.where((j) => j.id == widget.id).firstOrNull;
    final filtered = projects
        .where((p) => p.jobId == widget.id)
        .toList()
      ..sort((a, b) => b.startDate.compareTo(a.startDate));

    setState(() {
      _job = job;
      _projects = filtered;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    if (_isLoading) {
      return const SizedBox.shrink();
    }

    if (_job == null) {
      return SectionPlaceholderView(
        title: l10n.navCareer,
        message: l10n.sectionComingSoon(l10n.navCareer),
      );
    }

    return LayoutBase(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Sizes.medium,
        children: [
          Breadcrumb(
            segments: [
              BreadcrumbSegment(
                label: l10n.navCareer,
                onPressed: () => context.go(ProjectsView.route),
              ),
              BreadcrumbSegment(label: _job!.enterprise),
            ],
          ),
          ShowcasePeriodLabel(
            kind: ShowcasePeriodKind.job,
            startDate: _job!.startDate,
            endDate: _job!.endDate,
            enterpriseName: _job!.enterprise,
          ),
          TitleLargeText(
            _job!.jobTitle,
            color: context.appColors.onSurface,
          ),
          BodyLargeText(
            _job!.description,
            color: context.appColors.onSurface,
          ),
          if (_projects.isNotEmpty)
            Expanded(
              child: ProjectsGrid(showcases: _projects),
            ),
        ],
      ),
    );
  }
}
