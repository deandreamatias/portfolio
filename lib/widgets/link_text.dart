import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/context_extensions.dart';
import 'package:portfolio/shared/navigate_links.dart';

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
        // Recursively process the text before the link
        spans.addAll(_buildSpans(context, parts[0]));
        spans.add(
          TextSpan(
            text: key,
            semanticsLabel: key,
            style: context.appTextStyles.bodyLarge.copyWith(
              color: context.appColors.primary,
              decoration: .underline,
              decorationColor: context.appColors.primary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                final url = links[key];
                if (url != null) openLink(url);
              },
          ),
        );
        // Recursively process the text after the link
        spans.addAll(_buildSpans(context, parts.sublist(1).join(key)));
        break;
      }
    }

    if (!foundLink) {
      spans.add(TextSpan(text: text, style: context.appTextStyles.bodyLarge));
    }

    return spans;
  }
}
