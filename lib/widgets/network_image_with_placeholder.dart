import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/context_extensions.dart';
import 'package:portfolio/shared/sizes.dart';
import 'package:unicons/unicons.dart';

class NetworkImageWithPlaceholder extends StatelessWidget {
  const NetworkImageWithPlaceholder({
    required this.url,
    this.fit = BoxFit.cover,
    super.key,
  });

  final String url;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: fit,
      frameBuilder: (
        BuildContext context,
        Widget child,
        int? frame,
        bool wasSynchronouslyLoaded,
      ) {
        if (wasSynchronouslyLoaded || frame != null) return child;
        return _Placeholder();
      },
      errorBuilder: (context, error, stackTrace) => _Placeholder(),
    );
  }
}

class _Placeholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.appColors.surfaceContainerHigh,
      child: Center(
        child: Icon(
          UniconsLine.image,
          color: context.appColors.onSurfaceVariant,
          size: Sizes.extraLarge,
        ),
      ),
    );
  }
}
