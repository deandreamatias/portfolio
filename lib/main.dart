import 'package:flutter/foundation.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/shared/app_router.dart';
import 'package:portfolio/shared/app_theme.dart';
import 'package:portfolio/shared/context_extensions.dart';

Future<void> main() async {
  usePathUrlStrategy();
  runApp(const App());
  if (kIsWeb) SemanticsBinding.instance.ensureSemantics();
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
      bodyFontString: 'Geologica',
      displayFontString: 'Titan One',
    );
    final AppThemeData appTheme = AppThemeFactory.resolve(
      brightness: brightness,
      highContrast: highContrast,
      textStyles: baseTextStyles,
      typographyVariant: context.typographyVariant,
    );

    return AppTheme(
      data: appTheme,
      child: WidgetsApp.router(
        debugShowCheckedModeBanner: false,
        color: appTheme.colors.primary,
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context).appTitle,
        textStyle: appTheme.textStyles.bodyMedium,
        routerConfig: appRouter,
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
