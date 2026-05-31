import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:portfolio/shared/context_extensions.dart';
import 'package:portfolio/shared/sizes.dart';
import 'package:portfolio/widgets/network_image_with_placeholder.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: project.name,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => context.go('/projects/${project.id}'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Sizes.small),
                  child: _ProjectCardImage(logoUrl: project.logoUrl),
                ),
              ),
              const SizedBox(height: Sizes.extraSmall),
              Text(
                project.name,
                style: context.appTextStyles.bodyMedium.copyWith(
                  color: context.appColors.onSurface,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectCardImage extends StatelessWidget {
  const _ProjectCardImage({required this.logoUrl});

  final String? logoUrl;

  @override
  Widget build(BuildContext context) {
    final String? url = logoUrl;
    if (url == null) {
      return ColoredBox(
        color: context.appColors.surfaceContainerHigh,
        child: const SizedBox.expand(),
      );
    }
    return NetworkImageWithPlaceholder(url: url);
  }
}
