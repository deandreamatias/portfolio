import 'package:flutter/widgets.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/shared/constants.dart';
import 'package:portfolio/style/sizes.dart';
import 'package:portfolio/widgets/text/body_large_text.dart';
import 'package:portfolio/widgets/text/display_large_text.dart';

class HomeHero extends StatelessWidget {
  const HomeHero({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(Sizes.medium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Semantics(
            header: true,
            child: const DisplayLargeText(Constants.name, textAlign: .center),
          ),
          const SizedBox(height: Sizes.medium),
          BodyLargeText(l10n.homeSubtitle, textAlign: .center),
        ],
      ),
    );
  }
}
