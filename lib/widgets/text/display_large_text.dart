import 'package:flutter/material.dart';

class DisplayLargeText extends StatelessWidget {
  const DisplayLargeText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
