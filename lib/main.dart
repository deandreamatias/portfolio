import 'package:flutter/material.dart';

import 'core/utils/constants.dart';
import 'ui/router.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'deandreamatias',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          fontFamily: 'Asap',
          primarySwatch: Colors.red,
        ),
        initialRoute: RoutePaths.MAIN,
        onGenerateRoute: Router.generateRoute,
      );
  }
}