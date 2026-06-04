import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/data/models/showcase.dart';
import 'package:portfolio/ui/style/border_styles.dart';
import 'package:portfolio/ui/style/context_extensions.dart';
import 'package:portfolio/ui/style/sizes.dart';
import 'package:portfolio/ui/widgets/image_with_placeholder.dart';
import 'package:portfolio/ui/widgets/text/body_medium_text.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({required this.project, super.key});

  final Showcase project;

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
            crossAxisAlignment: .start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderStyles.br,
                  child: _ProjectCardImage(logoUrl: project.logo ?? Uri()),
                ),
              ),
              const SizedBox(height: Sizes.extraSmall),
              BodyMediumText(project.name, color: context.appColors.onSurface),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectCardImage extends StatelessWidget {
  const _ProjectCardImage({required this.logoUrl});

  final Uri logoUrl;

  @override
  Widget build(BuildContext context) {
    return ImageWithPlaceholder(uri: logoUrl);
  }
}
