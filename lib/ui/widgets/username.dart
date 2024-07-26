import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/constants.dart';

class Username extends StatelessWidget {
  const Username({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(Constants.username),
    );
  }
}

class Name extends StatelessWidget {
  const Name({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(Constants.name, textAlign: TextAlign.center),
    );
  }
}
