import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/context_extensions.dart';

class DisplayMediumText extends StatelessWidget {
  const DisplayMediumText(this.text, {this.color, this.textAlign, super.key});

  final String text;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: context.appTextStyles.displayMedium.copyWith(color: color),
    );
  }
}
