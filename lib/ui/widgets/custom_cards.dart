import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/navigate_links.dart';
import '../shared/portfolio_icons.dart';

class SkillsWidget extends StatelessWidget {
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
              Container(
                height: 24.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(Assets.FLUTTER),
                    Image.asset(Assets.ANDROID),
                    Image.asset(Assets.GIT),
                    Image.asset(Assets.ADOBEXD),
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
                onPressed: () => openLink('https://github.com/deandreamatias'),
                icon: const Icon(CustomIcons.github),
                label: Text(
                  AppLocalizations.of(context)!.github,
                  style: const TextStyle(fontFamily: 'Sniglet'),
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
                    style: const TextStyle(fontFamily: 'Sniglet'),
                  ),
                  Text(
                    AppLocalizations.of(context)!.languagesPortuguese,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontFamily: 'Sniglet'),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                AppLocalizations.of(context)!.languagesEnglish,
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Sniglet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactWidget extends StatelessWidget {
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
                    onPressed: () => openApp('mailto:deandreamatias@gmail.com'),
                    child: Text(
                      AppLocalizations.of(context)!.email,
                      style: const TextStyle(fontFamily: 'Sniglet'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => openLink(
                        'https://www.linkedin.com/in/deandreamatias/?locale=en_US'),
                    child: Text(
                      AppLocalizations.of(context)!.linkedin,
                      style: const TextStyle(fontFamily: 'Sniglet'),
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
