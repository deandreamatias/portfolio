import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/navigate_links.dart';
import '../views/home.dart';

enum MenuItems { en, es, pt }

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextButton(
        onPressed: () =>
            Navigator.of(context).pushReplacementNamed(HomeView.route),
        child: Text(
          AppLocalizations.of(context)!.menuHome,
          style: const TextStyle(fontFamily: 'Sniglet'),
        ),
      ),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: TextButton(
            onPressed: () => openLink(Uri.parse(Urls.podcast)),
            child: Text(
              AppLocalizations.of(context)!.menuPodcast,
              style: const TextStyle(fontFamily: 'Sniglet'),
            ),
          ),
        ),
      ],
    );
  }
}
