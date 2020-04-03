import 'package:flutter/material.dart';
import 'package:portfolio/ui/shared/portfolio_icons.dart';

import 'home.dart';

class MainView extends StatefulWidget {
  MainView({Key key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FlatButton(
          onPressed: () => print('object'),
          child: Text(
            'deandreamatias',
            style: TextStyle(fontFamily: 'Sniglet'),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: FlatButton(
              onPressed: () => print('object'),
              child: Text(
                'podcast',
                style: TextStyle(fontFamily: 'Sniglet'),
              ),
            ),
          ),
          IconButton(
            icon: Icon(CustomIcons.options),
            onPressed: () => print('object'),
          )
        ],
      ),
      body: HomeView(),
    );
  }
}
