import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/content.dart';
import 'package:portfolio/ui/widgets/header.dart';

import '../widgets/username.dart';

class HomeView extends StatefulWidget {
  static const String route = '/';
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Header(),
                Flexible(child: Content()),
              ],
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: Username())
        ],
      ),
    );
  }
}
