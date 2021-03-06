import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/utils/navigate_links.dart';
import '../shared/portfolio_icons.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8.0),
        Text(AppLocalizations.of(context)!.footerLocale),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(CustomIcons.linkedin),
              tooltip: AppLocalizations.of(context)!.linkedin,
              onPressed: () => openLink(
                  'https://www.linkedin.com/in/deandreamatias/?locale=en_US'),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: const Icon(CustomIcons.github),
              tooltip: AppLocalizations.of(context)!.github,
              onPressed: () => openLink('https://github.com/deandreamatias'),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: const Icon(CustomIcons.behance),
              tooltip: AppLocalizations.of(context)!.behance,
              onPressed: () =>
                  openLink('https://www.behance.net/deandreamatias'),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: const Icon(CustomIcons.twitter),
              tooltip: AppLocalizations.of(context)!.twitter,
              onPressed: () => openLink('https://twitter.com/deandreamatias'),
            ),
          ],
        )
      ],
    );
  }
}
