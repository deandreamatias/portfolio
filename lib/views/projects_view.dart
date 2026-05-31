import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/data/file_service.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/shared/constants.dart';
import 'package:portfolio/shared/context_extensions.dart';
import 'package:portfolio/shared/sizes.dart';
import 'package:portfolio/views/career_view.dart';
import 'package:portfolio/widgets/next_section_button.dart';
import 'package:portfolio/widgets/projects/projects_grid.dart';
import 'package:portfolio/widgets/text/display_large_text.dart';
import 'package:portfolio/widgets/text/title_large_text.dart';

class ProjectsView extends StatefulWidget {
  static const String route = '/projects';

  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  late final Future<List<Project>> _projectsFuture;

  @override
  void initState() {
    super.initState();
    _projectsFuture = _loadProjects();
  }

  Future<List<Project>> _loadProjects() async {
    final result = await const FileService().loadProjects();
    return result.fold((_) => [], (projects) => projects);
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.extraLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: Sizes.large),
                  Semantics(
                    header: true,
                    child: Center(child: DisplayLargeText(Constants.name)),
                  ),
                  const SizedBox(height: Sizes.large),
                  Semantics(
                    header: true,
                    child: TitleLargeText(
                      l10n.navProjects,
                      style: context.appTextStyles.titleLarge.copyWith(
                        color: context.appColors.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: Sizes.large),
                  Expanded(
                    child: FutureBuilder<List<Project>>(
                      future: _projectsFuture,
                      builder:
                          (
                            BuildContext ctx,
                            AsyncSnapshot<List<Project>> snapshot,
                          ) {
                            if (!snapshot.hasData) {
                              return const SizedBox.shrink();
                            }
                            return ProjectsGrid(projects: snapshot.data!);
                          },
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
      ),
    );
  }
}
