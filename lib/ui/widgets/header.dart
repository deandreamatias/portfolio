import 'package:flutter/material.dart';

import 'circular_image.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
    this.title,
    this.subtitle,
    this.image,
    this.streaming = false,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final String image;
  final bool streaming;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
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
                  const SizedBox(
                    width: 8.0,
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
          ),
        ),
      ),
    );
  }
}
