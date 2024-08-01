import 'package:flutter/material.dart';

class BodyLargeText extends StatelessWidget {
  const BodyLargeText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
