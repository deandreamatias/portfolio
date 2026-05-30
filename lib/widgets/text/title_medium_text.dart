import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/context_extensions.dart';

class TitleMediumText extends StatelessWidget {
  const TitleMediumText(this.text, {this.style, super.key});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? context.appTextStyles.titleMedium,
      textAlign: .center,
      maxLines: 2,
    );
  }
}
