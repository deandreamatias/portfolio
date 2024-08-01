import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/shared/constants.dart';
import 'package:portfolio/shared/navigate_links.dart';

class GithubButton extends StatelessWidget {
  const GithubButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => openLink(Uri.parse(Urls.github)),
      child: Text(
        AppLocalizations.of(context)!.github_button,
        textAlign: TextAlign.center,
      ),
    );
  }
}
