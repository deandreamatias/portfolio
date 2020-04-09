import 'package:flutter/material.dart';

import 'circular_image.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key key, this.title, this.subtitle, this.image})
      : super(key: key);
  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),
            CircularImage(image: image),
          ],
        ),
        const SizedBox(height: 16.0),
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
