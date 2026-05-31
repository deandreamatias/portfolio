import 'package:flutter/widgets.dart';
import 'package:portfolio/style/context_extensions.dart';

class TitleLargeText extends StatelessWidget {
  const TitleLargeText(this.text, {this.color, this.textAlign, super.key});

  final String text;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.appTextStyles.titleLarge.copyWith(color: color),
      textAlign: textAlign,
      maxLines: 2,
    );
  }
}
