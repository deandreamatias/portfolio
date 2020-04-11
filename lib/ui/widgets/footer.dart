import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../core/utils/navigate_links.dart';
import '../shared/portfolio_icons.dart';

class Footer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8.0),
        Text(translate('footer.local')),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(CustomIcons.linkedin),
              tooltip: translate('footer.buttons.linkedin'),
              onPressed: () => openLink(
                  'https://www.linkedin.com/in/deandreamatias/?locale=en_US'),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: const Icon(CustomIcons.github),
              tooltip: translate('footer.buttons.github'),
              onPressed: () =>
                  openLink('https://github.com/deandreamatias'),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: const Icon(CustomIcons.behance),
              tooltip: translate('footer.buttons.behance'),
              onPressed: () => openLink(
                  'https://www.behance.net/deandreamatias'),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: const Icon(CustomIcons.twitter),
              tooltip: translate('footer.buttons.twitter'),
              onPressed: () =>
                  openLink('https://twitter.com/deandreamatias'),
            ),
          ],
        )
      ],
    );
  }
}
