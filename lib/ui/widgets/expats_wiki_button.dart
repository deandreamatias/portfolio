import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/core/utils/constants.dart';
import 'package:portfolio/core/utils/navigate_links.dart';

class ExpatsWikiButton extends StatelessWidget {
  const ExpatsWikiButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => openLink(Uri.parse(Urls.brazilTechExpats)),
      child: Text(
        AppLocalizations.of(context)!.brazil_tech_expats,
        textAlign: TextAlign.center,
      ),
    );
  }
}
