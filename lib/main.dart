import 'package:flutter/material.dart';
import 'package:portfolio/ui/views/podcast.dart';

import 'ui/shared/styles.dart';
import 'ui/views/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'deandreamatias',
      themeMode: ThemeMode.dark,
      theme: themeDark,
      initialRoute: '/',
      routes: {
        HomeView.route: (BuildContext context) => HomeView(),
        PodcastView.route: (BuildContext context) => PodcastView(),
      },
    );
  }
}
