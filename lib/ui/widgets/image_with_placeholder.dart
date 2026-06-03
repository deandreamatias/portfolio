import 'package:flutter/widgets.dart';
import 'package:portfolio/ui/style/context_extensions.dart';
import 'package:portfolio/ui/style/sizes.dart';
import 'package:unicons/unicons.dart';

class ImageWithPlaceholder extends StatelessWidget {
  const ImageWithPlaceholder({
    required this.uri,
    this.fit = BoxFit.cover,
    super.key,
  });

  final Uri uri;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (!uri.hasScheme && uri.path.startsWith('assets/')) {
      return Image.asset(
        uri.path,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _Placeholder(),
      );
    }

    return Image.network(
      uri.toString(),
      fit: fit,
      frameBuilder:
          (
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
