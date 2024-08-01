import 'package:flutter/material.dart';

class BodySmallText extends StatelessWidget {
  const BodySmallText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
