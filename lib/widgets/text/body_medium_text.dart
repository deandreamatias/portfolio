import 'package:flutter/material.dart';

class BodyMediumText extends StatelessWidget {
  const BodyMediumText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodyMedium);
  }
}
