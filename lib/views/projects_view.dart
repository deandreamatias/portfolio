import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/data/file_service.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/style/border_styles.dart';
import 'package:portfolio/style/context_extensions.dart';
import 'package:portfolio/style/sizes.dart';
import 'package:portfolio/views/career_view.dart';
import 'package:portfolio/widgets/brand_name.dart';
import 'package:portfolio/widgets/next_section_button.dart';
import 'package:portfolio/widgets/projects/projects_grid.dart';
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
                        vertical: Sizes.small,
                      ),
                      child: Column(
                        mainAxisSize: .min,
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
                                    return ProjectsGrid(
                                      projects: snapshot.data!,
                                    );
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
