import 'package:flutter/widgets.dart';
import 'package:portfolio/style/context_extensions.dart';

class DisplayLargeText extends StatelessWidget {
  const DisplayLargeText(this.text, {this.color, this.textAlign, super.key});

  final String text;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: context.appTextStyles.displayLarge.copyWith(color: color),
    );
  }
}
