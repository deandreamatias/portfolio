import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/constants.dart';
import 'package:portfolio/ui/views/home.dart';
import 'package:portfolio/ui/views/podcast.dart';

import '../shared/portfolio_icons.dart';

enum MenuItems { en, es, pt }

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: FlatButton(
        // TODO: Fix back button in second time
        onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
          HomeView.route,
          ModalRoute.withName(HomeView.route),
        ),
        child: Text(
          'deandreamatias',
          style: TextStyle(fontFamily: 'Sniglet'),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: FlatButton(
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
              PodcastView.route,
              ModalRoute.withName(HomeView.route),
            ),
            child: Text(
              'podcast',
              style: TextStyle(fontFamily: 'Sniglet'),
            ),
          ),
        ),
        IconButton(icon: Icon(Icons.navigation), onPressed: null),
        PopupMenuButton<MenuItems>(
          icon: Icon(CustomIcons.options),
          tooltip: 'Options',
          onSelected: (MenuItems value) async {
            switch (value) {
              case MenuItems.es:
                break;
              case MenuItems.pt:
                break;
              default:
            }
          },
          itemBuilder: (BuildContext context) =>
              <CheckedPopupMenuItem<MenuItems>>[
            CheckedPopupMenuItem<MenuItems>(
                value: MenuItems.en, checked: true, child: Text('English')),
            const CheckedPopupMenuItem<MenuItems>(
              value: MenuItems.es,
              child: Text('Spanish'),
            ),
            const CheckedPopupMenuItem<MenuItems>(
              value: MenuItems.pt,
              child: Text('Portuguese'),
            ),
          ],
        ),
      ],
    );
  }
}
