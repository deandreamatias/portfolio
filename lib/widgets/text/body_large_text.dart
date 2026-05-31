import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/context_extensions.dart';

class BodyLargeText extends StatelessWidget {
  const BodyLargeText(this.text, {this.color, this.textAlign, super.key});

  final String text;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.appTextStyles.bodyLarge.copyWith(color: color),
      textAlign: textAlign,
    );
  }
}
