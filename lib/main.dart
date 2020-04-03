import 'package:flutter/material.dart';

import 'core/utils/constants.dart';
import 'ui/router.dart';
import 'ui/shared/styles.dart';


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
        initialRoute: RoutePaths.MAIN,
        onGenerateRoute: Router.generateRoute,
      );
  }
}