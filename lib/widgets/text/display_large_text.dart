import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/context_extensions.dart';

class DisplayLargeText extends StatelessWidget {
  const DisplayLargeText(this.text, {this.style, super.key});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: .center,
      style: style ?? context.appTextStyles.displayLarge,
    );
  }
}
