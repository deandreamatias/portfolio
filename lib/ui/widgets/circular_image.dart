import 'package:flutter/material.dart';

import 'package:portfolio/ui/shared/styles.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    Key key,
    @required this.image,
    this.button,
  }) : super(key: key);

  final String image;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: CircleAvatar(
        backgroundImage: NetworkImage(image),
        child: button,
      ),
      padding: const EdgeInsets.all(2.0),
      decoration: const BoxDecoration(
        color: ACCENT,
        shape: BoxShape.circle,
      ),
    );
  }
}
