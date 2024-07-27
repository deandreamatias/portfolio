import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'ui/shared/theme.dart';
import 'ui/shared/util.dart';
import 'ui/views/home.dart';

Future<void> main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Asap", "Geologica");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'deandreamatias | Mobile developer with Flutter',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        HomeView.route: (BuildContext context) => const HomeView(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
