import 'package:flutter/material.dart';

import '../shared/portfolio_icons.dart';
import '../widgets/footer.dart';
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
            child: const Footer(),
          )
        ],
      ),
    );
  }
}
