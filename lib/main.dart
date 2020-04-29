import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_translate/localization_delegate.dart';
import 'package:portfolio/ui/views/podcast.dart';

import 'ui/shared/styles.dart';
import 'ui/views/home.dart';

Future<void> main() async {
  final LocalizationDelegate delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en',
    supportedLocales: <String>['en', 'es', 'pt'],
  );

  runApp(LocalizedApp(delegate, App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LocalizationDelegate localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'deandreamatias | Mobile developer with Flutter',
        themeMode: ThemeMode.dark,
        theme: themeDark,
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          HomeView.route: (BuildContext context) => HomeView(),
          PodcastView.route: (BuildContext context) => PodcastView(),
        },
        localizationsDelegates: <LocalizationsDelegate<dynamic>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate,
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
      ),
    );
  }
}
