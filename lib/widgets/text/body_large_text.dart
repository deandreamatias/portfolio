import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/context_extensions.dart';

class BodyLargeText extends StatelessWidget {
  const BodyLargeText(this.text, {this.textAlign, this.style, super.key});

  final String text;
  final TextAlign? textAlign;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? context.appTextStyles.bodyLarge,
      textAlign: textAlign,
    );
  }
}
