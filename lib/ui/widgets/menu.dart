import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/core/utils/constants.dart';
import 'package:portfolio/core/utils/navigate_links.dart';

import '../shared/portfolio_icons.dart';
import '../views/home.dart';

enum MenuItems { en, es, pt }

class MenuWidget extends StatelessWidget {
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
            onPressed: () => openLink(Urls.PODCAST),
            child: Text(
              AppLocalizations.of(context)!.menuPodcast,
              style: const TextStyle(fontFamily: 'Sniglet'),
            ),
          ),
        ),
        const SizedBox(width: 8.0, height: 8.0),
        PopupMenuButton<MenuItems>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          icon: const Icon(CustomIcons.options),
          tooltip: AppLocalizations.of(context)!.menuOptions,
          onSelected: (MenuItems value) {
            switch (value) {
              case MenuItems.es:
                AppLocalizations.delegate.load(const Locale('es', ''));
                break;
              case MenuItems.pt:
                AppLocalizations.delegate.load(const Locale('pt', ''));
                break;
              default:
                AppLocalizations.delegate.load(const Locale('en', ''));
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuItem<MenuItems>>[
            PopupMenuItem<MenuItems>(
              value: MenuItems.en,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Visibility(
                      visible: AppLocalizations.of(context)!.localeName == 'en',
                      child: const Icon(CustomIcons.checkmark),
                    ),
                    Text(AppLocalizations.of(context)!.menuOptionsEnglish),
                  ],
                ),
              ),
            ),
            PopupMenuItem<MenuItems>(
              value: MenuItems.es,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Visibility(
                      visible: AppLocalizations.of(context)!.localeName == 'es',
                      child: const Icon(CustomIcons.checkmark),
                    ),
                    Text(AppLocalizations.of(context)!.menuOptionsSpanish),
                  ],
                ),
              ),
            ),
            PopupMenuItem<MenuItems>(
              value: MenuItems.pt,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Visibility(
                      visible: AppLocalizations.of(context)!.localeName == 'pt',
                      child: const Icon(CustomIcons.checkmark),
                    ),
                    Text(AppLocalizations.of(context)!.menuOptionsPortuguese),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
