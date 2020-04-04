import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/portfolio_icons.dart';
import 'home.dart';
import 'podcast.dart';

enum MenuItems { en, es, pt }

class MainView extends StatefulWidget {
  MainView({Key key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool home;

  @override
  void initState() {
    home ??= true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FlatButton(
          onPressed: () {
            setState(() {
              home = true;
            });
          },
          child: Text(
            'deandreamatias',
            style: TextStyle(fontFamily: 'Sniglet'),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  home = false;
                });
              },
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: home ? HomeView() : PodcastView()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 8.0),
                Text('Valencia, Spain'),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(CustomIcons.linkedin),
                      onPressed: () => _navigateLink(
                          'https://www.linkedin.com/in/deandreamatias/?locale=en_US'),
                    ),
                    const SizedBox(width: 16.0),
                    IconButton(
                      icon: Icon(CustomIcons.github),
                      onPressed: () =>
                          _navigateLink('https://github.com/deandreamatias'),
                    ),
                    const SizedBox(width: 16.0),
                    IconButton(
                      icon: Icon(CustomIcons.behance),
                      onPressed: () => _navigateLink(
                          'https://www.behance.net/deandreamatias'),
                    ),
                    const SizedBox(width: 16.0),
                    IconButton(
                      icon: Icon(CustomIcons.twitter),
                      onPressed: () =>
                          _navigateLink('https://twitter.com/deandreamatias'),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Future<void> _navigateLink(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
    print('Launched');
  } else {
    throw 'Could not launch $url';
  }
}
