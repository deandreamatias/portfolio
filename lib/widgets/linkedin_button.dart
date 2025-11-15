import 'package:flutter/material.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/shared/constants.dart';
import 'package:portfolio/shared/navigate_links.dart';

class LinkedinButton extends StatelessWidget {
  const LinkedinButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => openLink(Uri.parse(Urls.linkedin)),
      child: Text(
        AppLocalizations.of(context).cv_button,
        textAlign: TextAlign.center,
      ),
    );
  }
}
