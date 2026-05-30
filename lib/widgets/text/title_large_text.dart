import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/context_extensions.dart';

class TitleLargeText extends StatelessWidget {
  const TitleLargeText(this.text, {this.style, super.key});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? context.appTextStyles.titleLarge,
      textAlign: .center,
      maxLines: 2,
    );
  }
}
