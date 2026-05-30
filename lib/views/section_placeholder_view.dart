import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.extraLarge),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Semantics(header: true, child: TitleLargeText(title)),
                const SizedBox(height: Sizes.large),
                BodyLargeText(message, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
