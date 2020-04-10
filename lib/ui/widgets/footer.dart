import 'package:flutter/material.dart';

import '../../core/utils/navigate_links.dart';
import '../shared/portfolio_icons.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8.0),
        const Text('Valencia, Spain'),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(CustomIcons.linkedin),
              onPressed: () => openLink(
                  'https://www.linkedin.com/in/deandreamatias/?locale=en_US'),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: Icon(CustomIcons.github),
              onPressed: () =>
                  openLink('https://github.com/deandreamatias'),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: Icon(CustomIcons.behance),
              onPressed: () => openLink(
                  'https://www.behance.net/deandreamatias'),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: Icon(CustomIcons.twitter),
              onPressed: () =>
                  openLink('https://twitter.com/deandreamatias'),
            ),
          ],
        )
      ],
    );
  }
}
