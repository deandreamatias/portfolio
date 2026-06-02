import 'package:flutter/widgets.dart';
import 'package:portfolio/data/models/showcase.dart';
import 'package:portfolio/style/context_extensions.dart';
import 'package:portfolio/style/sizes.dart';
import 'package:portfolio/widgets/projects/project_card.dart';
import 'package:portfolio/widgets/text/body_large_text.dart';

// Image square + gap + 2 lines of bodyMedium (≈14*1.43*2) + small padding
const double _mainAxisExtent = 212;

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({required this.showcases, super.key});

  final List<Showcase> showcases;

  @override
  Widget build(BuildContext context) {
    if (showcases.isEmpty) return BodyLargeText('Empty', textAlign: .center);

    final SliverGridDelegate delegate = context.isMedium
        ? const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 160,
            mainAxisSpacing: Sizes.medium,
            crossAxisSpacing: Sizes.medium,
            mainAxisExtent: _mainAxisExtent,
          )
        : const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: Sizes.medium,
            crossAxisSpacing: Sizes.medium,
            mainAxisExtent: _mainAxisExtent,
          );

    return GridView.builder(
      gridDelegate: delegate,
      itemCount: showcases.length,
      itemBuilder: (BuildContext context, int index) =>
          ProjectCard(project: showcases[index]),
    );
  }
}
