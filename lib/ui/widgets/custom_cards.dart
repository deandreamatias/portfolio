import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/navigate_links.dart';
import '../shared/portfolio_icons.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text(
                AppLocalizations.of(context)!.skillsTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 24.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(Assets.flutter),
                    Image.asset(Assets.android),
                    Image.asset(Assets.git),
                    Image.asset(Assets.adobXd),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GithubWidget extends StatelessWidget {
  const GithubWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () =>
                    openLink(Uri.parse('https://github.com/deandreamatias')),
                icon: const Icon(CustomIcons.github),
                label: Text(
                  AppLocalizations.of(context)!.github,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                fit: FlexFit.loose,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    AppLocalizations.of(context)!.githubTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguagesWidget extends StatelessWidget {
  const LanguagesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    AppLocalizations.of(context)!.languagesTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.languagesSpanish,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    AppLocalizations.of(context)!.languagesPortuguese,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                AppLocalizations.of(context)!.languagesEnglish,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text(AppLocalizations.of(context)!.contactTitle),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () =>
                        openApp(Uri.parse('mailto:deandreamatias@gmail.com')),
                    child: Text(
                      AppLocalizations.of(context)!.email,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => openLink(Uri.parse(
                        'https://www.linkedin.com/in/deandreamatias/?locale=en_US')),
                    child: Text(
                      AppLocalizations.of(context)!.linkedin,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
