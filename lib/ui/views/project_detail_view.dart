import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/data/file_service.dart';
import 'package:portfolio/data/models/job.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:portfolio/data/navigate_links.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/ui/style/context_extensions.dart';
import 'package:portfolio/ui/style/sizes.dart';
import 'package:portfolio/ui/views/projects_view.dart';
import 'package:portfolio/ui/views/section_placeholder_view.dart';
import 'package:portfolio/ui/widgets/breadcrumb/breadcrumb.dart';
import 'package:portfolio/ui/widgets/buttons/button_filled.dart';
import 'package:portfolio/ui/widgets/buttons/button_transparent.dart';
import 'package:portfolio/ui/widgets/image_with_placeholder.dart';
import 'package:portfolio/ui/widgets/layout_base.dart';
import 'package:portfolio/ui/widgets/showcase_period/showcase_period_label.dart';
import 'package:portfolio/ui/widgets/text/body_large_text.dart';
import 'package:portfolio/ui/widgets/text/body_medium_text.dart';
import 'package:unicons/unicons.dart';

class ProjectDetailView extends StatefulWidget {
  const ProjectDetailView({required this.id, super.key});

  final String id;

  @override
  State<ProjectDetailView> createState() => _ProjectDetailViewState();
}

class _ProjectDetailViewState extends State<ProjectDetailView> {
  Project? _project;
  Job? _relatedJob;
  List<Project> _allProjects = const [];
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
      final jobs = jobsResult.fold((_) => <Job>[], (jobs) => jobs);
      job = jobs.where((j) => j.id == project.jobId).firstOrNull;
    }

    setState(() {
      _project = project;
      _relatedJob = job;
      _allProjects = projects;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final isMedium = context.isMedium;

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
        links.add(ButtonFilled(label: label, onPressed: () => _launchUrl(uri)));
      }
    }

    addButton('Google Play', _project!.links.googlePlay);
    addButton('App Store', _project!.links.appStore);
    addButton('Website', _project!.links.web);
    addButton('Repository', _project!.links.repository);

    final otherProjects = _allProjects.where((p) => p.id != widget.id).toList();

    return LayoutBase(
      child: _ProjectCard(
        isMedium: isMedium,
        project: _project!,
        relatedJob: _relatedJob,
        links: links,
        otherProjects: otherProjects,
        l10n: l10n,
        onBreadcrumbTap: () => context.go(ProjectsView.route),
        onJobTap: () => context.go('/jobs/${_project!.jobId}'),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    await openLink(url);
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.isMedium,
    required this.project,
    required this.relatedJob,
    required this.links,
    required this.otherProjects,
    required this.l10n,
    required this.onBreadcrumbTap,
    required this.onJobTap,
  });

  final bool isMedium;
  final Project project;
  final Job? relatedJob;
  final List<Widget> links;
  final List<Project> otherProjects;
  final AppLocalizations l10n;
  final VoidCallback onBreadcrumbTap;
  final VoidCallback onJobTap;

  @override
  Widget build(BuildContext context) {
    final cardTextColor = context.appColors.onSurface;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: _BreadcrumbRow(
            project: project,
            relatedJob: relatedJob,
            l10n: l10n,
            onBreadcrumbTap: onBreadcrumbTap,
            onJobTap: onJobTap,
          ),
        ),
        SizedBox(height: isMedium ? Sizes.extraLarge : Sizes.large),
        if (isMedium)
          Row(
            crossAxisAlignment: .start,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 330,
                  maxHeight: 330,
                ),
                child: ImageWithPlaceholder(uri: project.logo ?? Uri()),
              ),
              const SizedBox(width: Sizes.extraLarge),
              Expanded(
                child: _DetailsColumn(
                  project: project,
                  links: links,
                  spacing: Sizes.extraLarge,
                  cardTextColor: cardTextColor,
                ),
              ),
            ],
          )
        else
          Column(
            children: [
              _DetailsColumn(
                project: project,
                links: links,
                spacing: Sizes.medium,
                cardTextColor: cardTextColor,
              ),
              const SizedBox(height: Sizes.large),
              ImageWithPlaceholder(uri: project.logo ?? Uri()),
            ],
          ),
        const Spacer(),
        if (otherProjects.isNotEmpty)
          _OtherProjectsButton(
            otherProjects: otherProjects,
            l10n: l10n,
            onTap: onBreadcrumbTap,
          ),
      ],
    );
  }
}

class _BreadcrumbRow extends StatelessWidget {
  const _BreadcrumbRow({
    required this.project,
    required this.relatedJob,
    required this.l10n,
    required this.onBreadcrumbTap,
    required this.onJobTap,
  });

  final Project project;
  final Job? relatedJob;
  final AppLocalizations l10n;
  final VoidCallback onBreadcrumbTap;
  final VoidCallback onJobTap;

  @override
  Widget build(BuildContext context) {
    return Breadcrumb(
      segments: [
        BreadcrumbSegment(label: l10n.navProjects, onPressed: onBreadcrumbTap),
        if (relatedJob != null)
          BreadcrumbSegment(label: relatedJob!.enterprise, onPressed: onJobTap),
        BreadcrumbSegment(label: project.name),
      ],
    );
  }
}

class _DetailsColumn extends StatelessWidget {
  const _DetailsColumn({
    required this.project,
    required this.links,
    required this.spacing,
    required this.cardTextColor,
  });

  final Project project;
  final List<Widget> links;
  final double spacing;
  final Color cardTextColor;

  @override
  Widget build(BuildContext context) {
    final technologies = project.technologies.join(' · ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: spacing,
      children: [
        _DetailRow(
          icon: UniconsLine.paragraph,
          child: BodyLargeText(project.description),
        ),
        _DetailRow(
          icon: UniconsLine.calendar_alt,
          child: ShowcasePeriodLabel.fromShowcase(
            project,
            key: const ValueKey('period'),
          ),
        ),
        if (technologies.isNotEmpty)
          _DetailRow(
            icon: UniconsLine.brackets_curly,
            child: BodyMediumText(technologies),
          ),
        if (links.isNotEmpty)
          Wrap(spacing: Sizes.medium, runSpacing: Sizes.small, children: links),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.icon, required this.child});

  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      spacing: Sizes.small,
      children: [
        Icon(icon, color: context.appColors.onSurfaceVariant, size: 24),
        Expanded(child: child),
      ],
    );
  }
}

class _OtherProjectsButton extends StatelessWidget {
  const _OtherProjectsButton({
    required this.otherProjects,
    required this.l10n,
    required this.onTap,
  });

  final List<Project> otherProjects;
  final AppLocalizations l10n;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final firstOther = otherProjects.first;
    final remainingCount = otherProjects.length - 1;

    final label = remainingCount > 0
        ? l10n.projectDetailMoreProjects(remainingCount, firstOther.name)
        : firstOther.name;

    return ButtonTransparent(
      label: label,
      semanticLabel: l10n.projectDetailMoreProjects(
        remainingCount,
        firstOther.name,
      ),
      icon: UniconsLine.angle_double_down,
      onPressed: onTap,
    );
  }
}
