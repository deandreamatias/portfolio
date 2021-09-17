import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'ui/shared/styles.dart';
import 'ui/views/home.dart';

Future<void> main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'deandreamatias | Mobile developer with Flutter',
      themeMode: ThemeMode.dark,
      theme: themeDark,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        HomeView.route: (BuildContext context) => const HomeView(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
