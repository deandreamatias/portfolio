import 'package:flutter/material.dart';

class BodySmallText extends StatelessWidget {
  const BodySmallText(this.text, {this.textAlign, super.key});

  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: textAlign,
    );
  }
}
