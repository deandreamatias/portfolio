import 'package:flutter/widgets.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/shared/app_theme.dart';
import 'package:portfolio/shared/context_extensions.dart';

import 'views/about_view.dart';
import 'views/contact_view.dart';
import 'views/home.dart';
import 'views/projects_view.dart';
import 'views/trajectory_view.dart';

import 'package:flutter/semantics.dart';
import 'package:flutter/foundation.dart';

PageRoute<T> _pageRouteBuilder<T>(
  RouteSettings settings,
  WidgetBuilder builder,
) {
  return PageRouteBuilder<T>(
    settings: settings,
    pageBuilder:
        (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) => builder(context),
    transitionsBuilder:
        (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) => child,
  );
}

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
    final view = View.of(context);
    final Brightness brightness = view.platformDispatcher.platformBrightness;
    final bool highContrast =
        view.platformDispatcher.accessibilityFeatures.highContrast;

    final AppTextStyles baseTextStyles = AppTextStyles.fromFonts(
      bodyFontString: "Geologica",
      displayFontString: "Titan One",
    );
    final AppThemeData appTheme = AppThemeFactory.resolve(
      brightness: brightness,
      highContrast: highContrast,
      textStyles: baseTextStyles,
    );

    return AppTheme(
      data: appTheme,
      child: WidgetsApp(
        debugShowCheckedModeBanner: false,
        color: appTheme.colors.primary,
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context).appTitle,
        textStyle: appTheme.textStyles.bodyMedium,
        pageRouteBuilder: _pageRouteBuilder,
        initialRoute: HomeView.route,
        routes: <String, WidgetBuilder>{
          HomeView.route: (BuildContext context) => const HomeView(),
          ProjectsView.route: (BuildContext context) => const ProjectsView(),
          TrajectoryView.route: (BuildContext context) =>
              const TrajectoryView(),
          AboutView.route: (BuildContext context) => const AboutView(),
          ContactView.route: (BuildContext context) => const ContactView(),
        },
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (BuildContext context, Widget? child) {
          if (child == null) {
            return const SizedBox.shrink();
          }
          return ColoredBox(color: context.appColors.surface, child: child);
        },
      ),
    );
  }
}
