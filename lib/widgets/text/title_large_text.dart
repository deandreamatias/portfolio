import 'package:flutter/material.dart';

class TitleLargeText extends StatelessWidget {
  const TitleLargeText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }
}
