import 'package:flutter/material.dart';

class BodyLargeText extends StatelessWidget {
  const BodyLargeText(this.text, {this.textAlign, super.key});

  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: textAlign,
    );
  }
}
