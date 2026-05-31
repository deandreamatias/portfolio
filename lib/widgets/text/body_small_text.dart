import 'package:flutter/widgets.dart';
import 'package:portfolio/style/context_extensions.dart';

class BodySmallText extends StatelessWidget {
  const BodySmallText(this.text, {this.color, this.textAlign, super.key});

  final String text;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.appTextStyles.bodySmall.copyWith(color: color),
      textAlign: textAlign,
    );
  }
}
