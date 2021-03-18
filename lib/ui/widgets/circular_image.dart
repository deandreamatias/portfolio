import 'package:flutter/material.dart';

import 'package:portfolio/ui/shared/styles.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    required Key key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: CircleAvatar(
        backgroundImage: NetworkImage(image),
      ),
      padding: const EdgeInsets.all(2.0),
      decoration: const BoxDecoration(
        color: ACCENT,
        shape: BoxShape.circle,
      ),
    );
  }
}
