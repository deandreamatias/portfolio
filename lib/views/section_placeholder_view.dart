import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/context_extensions.dart';
import 'package:portfolio/shared/sizes.dart';
import 'package:portfolio/widgets/text/body_large_text.dart';
import 'package:portfolio/widgets/text/title_large_text.dart';

class SectionPlaceholderView extends StatelessWidget {
  const SectionPlaceholderView({
    required this.title,
    required this.message,
    super.key,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.appColors.surface,
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Padding(
              padding: const EdgeInsets.all(Sizes.medium),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Semantics(
                    header: true,
                    child: TitleLargeText(title, textAlign: TextAlign.center),
                  ),
                  const SizedBox(height: Sizes.medium),
                  BodyLargeText(message, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
