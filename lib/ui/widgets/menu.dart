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
      automaticallyImplyLeading: false,
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
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
          itemBuilder: (BuildContext context) => <PopupMenuItem<MenuItems>>[
            PopupMenuItem<MenuItems>(
              value: MenuItems.en,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Visibility(
                      visible:
                          LocalizedApp.of(context).delegate.currentLocale ==
                              const Locale('en'),
                      child: const Icon(CustomIcons.checkmark),
                    ),
                    Text(translate('menu.options.english')),
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
                      visible:
                          LocalizedApp.of(context).delegate.currentLocale ==
                              const Locale('es'),
                      child: const Icon(CustomIcons.checkmark),
                    ),
                    Text(translate('menu.options.spanish')),
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
                      visible:
                          LocalizedApp.of(context).delegate.currentLocale ==
                              const Locale('pt'),
                      child: const Icon(CustomIcons.checkmark),
                    ),
                    Text(translate('menu.options.portuguese')),
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
