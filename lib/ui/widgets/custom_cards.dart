import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../core/data/streamigs.dart';
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
                translate('home.skills.title'),
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
              RaisedButton.icon(
                onPressed: () => openLink('https://github.com/deandreamatias'),
                icon: const Icon(CustomIcons.github),
                label: Text(
                  translate('home.github.button'),
                  style: const TextStyle(fontFamily: 'Sniglet'),
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                fit: FlexFit.loose,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    translate('home.github.title'),
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
                    translate('home.languages.title'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    translate('home.languages.spanish'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontFamily: 'Sniglet'),
                  ),
                  Text(
                    translate('home.languages.portuguese'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontFamily: 'Sniglet'),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                translate('home.languages.english'),
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
              Text(translate('home.contact.title')),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => openApp('mailto:deandreamatias@gmail.com'),
                    child: Text(
                      translate('home.contact.button_email'),
                      style: const TextStyle(fontFamily: 'Sniglet'),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => openLink(
                        'https://www.linkedin.com/in/deandreamatias/?locale=en_US'),
                    child: Text(
                      translate('home.contact.button_linkedin'),
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

class StreamingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                translate('podcast.streaming.title'),
                textAlign: TextAlign.center,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 70,
                  maxHeight: 80,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  padding: const EdgeInsets.only(top: 4.0),
                  itemCount: streamings.length,
                  itemBuilder: (BuildContext context, int index) => IconButton(
                    icon: Image.asset(streamings[index].image),
                    onPressed: () => openLink(streamings[index].url),
                    tooltip: streamings[index].title,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
