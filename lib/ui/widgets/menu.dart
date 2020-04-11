import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../shared/portfolio_icons.dart';
import '../views/home.dart';
import '../views/podcast.dart';

enum MenuItems { en, es, pt }

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: FlatButton(
        onPressed: () =>
            Navigator.of(context).pushReplacementNamed(HomeView.route),
        child: Text(
          translate('menu.home'),
          style: const TextStyle(fontFamily: 'Sniglet'),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: FlatButton(
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed(PodcastView.route),
            child: Text(
              translate('menu.podcast'),
              style: const TextStyle(fontFamily: 'Sniglet'),
            ),
          ),
        ),
        PopupMenuButton<MenuItems>(
          icon: const Icon(CustomIcons.options),
          tooltip: translate('menu.options.description'),
          onSelected: (MenuItems value) {
            switch (value) {
              case MenuItems.es:
                changeLocale(context, 'es');
                break;
              case MenuItems.pt:
                changeLocale(context, 'pt');
                break;
              default:
                changeLocale(context, 'en');
            }
          },
          itemBuilder: (BuildContext context) =>
              <CheckedPopupMenuItem<MenuItems>>[
            CheckedPopupMenuItem<MenuItems>(
              value: MenuItems.en,
              checked: LocalizedApp.of(context).delegate.currentLocale ==
                  const Locale('en'),
              child: Text(translate('menu.options.english')),
            ),
            CheckedPopupMenuItem<MenuItems>(
              value: MenuItems.es,
              checked: LocalizedApp.of(context).delegate.currentLocale ==
                  const Locale('es'),
              child: Text(translate('menu.options.spanish')),
            ),
            CheckedPopupMenuItem<MenuItems>(
              value: MenuItems.pt,
              checked: LocalizedApp.of(context).delegate.currentLocale ==
                  const Locale('pt'),
              child: Text(translate('menu.options.portuguese')),
            ),
          ],
        ),
      ],
    );
  }
}
