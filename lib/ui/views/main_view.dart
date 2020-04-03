import 'package:flutter/material.dart';

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
        title:  FlatButton(onPressed: () => print('object'), child: Text('deandreamatias'),),
        actions: <Widget>[
          FlatButton(onPressed: () => print('object'), child: Text('podcast'),),
          IconButton(icon: Icon(Icons.edit_attributes), onPressed: () => print('object'),)
        ],
      ),
      body: HomeView(),
    );
  }
}
