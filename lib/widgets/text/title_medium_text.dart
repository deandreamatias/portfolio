import 'package:flutter/material.dart';

class TitleMediumText extends StatelessWidget {
  const TitleMediumText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
      textAlign: .center,
      maxLines: 2,
    );
  }
}
