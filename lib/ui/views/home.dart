import 'package:flutter/material.dart';
import 'package:portfolio/ui/shared/context_extensions.dart';
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Expanded(
              child: Column(children: [Header(), Flexible(child: Content())])),
          if (!context.isLarge)
            const Align(alignment: Alignment.bottomCenter, child: Username())
        ],
      ),
    );
  }
}
