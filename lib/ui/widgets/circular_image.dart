import 'package:flutter/material.dart';

import 'package:portfolio/ui/shared/styles.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    Key key,
    @required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
      ),
      width: 70.0,
      height: 70.0,
      padding: const EdgeInsets.all(2.0),
      decoration: const BoxDecoration(
        color: ACCENT,
        shape: BoxShape.circle,
      ),
    );
  }
}