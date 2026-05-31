import 'package:flutter/widgets.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:portfolio/shared/context_extensions.dart';
import 'package:portfolio/shared/sizes.dart';
import 'package:portfolio/widgets/projects/project_card.dart';

// Image square + gap + 2 lines of bodyMedium (≈14*1.43*2) + small padding
const double _mainAxisExtent = 212;

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({required this.projects, super.key});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    final SliverGridDelegate delegate = context.isMedium
        ? const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 160,
            mainAxisSpacing: Sizes.large,
            crossAxisSpacing: Sizes.large,
            mainAxisExtent: _mainAxisExtent,
          )
        : const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: Sizes.large,
            crossAxisSpacing: Sizes.large,
            mainAxisExtent: _mainAxisExtent,
          );

    return GridView.builder(
      gridDelegate: delegate,
      itemCount: projects.length,
      itemBuilder: (BuildContext context, int index) =>
          ProjectCard(project: projects[index]),
    );
  }
}
