import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/navigate_links.dart';

class LinkText extends StatelessWidget {
  final String text;
  final Map<String, Uri> links;

  const LinkText({required this.text, required this.links, super.key});
  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = _buildSpans(context, text);

    return RichText(text: TextSpan(children: spans));
  }

  List<TextSpan> _buildSpans(BuildContext context, String text) {
    List<TextSpan> spans = [];
    bool foundLink = false;

    for (var key in links.keys) {
      if (text.contains(key)) {
        foundLink = true;
        final parts = text.split(key);
        spans.addAll(_buildSpans(
            context, parts[0])); // Recursively process the text before the link
        spans.add(
          TextSpan(
            text: key,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).colorScheme.primary,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                final url = links[key];
                if (url != null) openLink(url);
              },
          ),
        );
        spans.addAll(_buildSpans(
            context,
            parts
                .sublist(1)
                .join(key))); // Recursively process the text after the link
        break;
      }
    }

    if (!foundLink) {
      spans.add(
        TextSpan(
          text: text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return spans;
  }
}
