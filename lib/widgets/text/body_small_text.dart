import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/context_extensions.dart';

class BodySmallText extends StatelessWidget {
  const BodySmallText(this.text, {this.textAlign, this.style, super.key});

  final String text;
  final TextAlign? textAlign;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? context.appTextStyles.bodySmall,
      textAlign: textAlign,
    );
  }
}
