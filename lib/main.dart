import 'package:flutter/material.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/shared/context_extensions.dart';

import 'shared/theme.dart';
import 'views/home.dart';

import 'package:flutter/semantics.dart';
import 'package:flutter/foundation.dart';

Future<void> main() async {
  runApp(const App());
  if (kIsWeb) {
    SemanticsBinding.instance.ensureSemantics();
  }
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = context.createTextTheme(
      bodyFontString: "Asap",
      displayFontString: "Geologica",
    );

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'deandreamatias | Mobile developer with Flutter',
      theme: brightness == .light ? theme.light() : theme.dark(),
      initialRoute: HomeView.route,
      routes: <String, WidgetBuilder>{
        HomeView.route: (BuildContext context) => const HomeView(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
