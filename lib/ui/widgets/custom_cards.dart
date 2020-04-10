import 'dart:html';

import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/navigate_links.dart';
import '../shared/portfolio_icons.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({Key key}) : super(key: key);

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
                'My loved technologies and tools are',
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
  const GithubWidget({Key key}) : super(key: key);

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
                icon: Icon(CustomIcons.github),
                label: Text(
                  'Github',
                  style: TextStyle(fontFamily: 'Sniglet'),
                ),
              ),
              SizedBox(width: 12),
              Flexible(
                fit: FlexFit.loose,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    'Open source projects are awesome and sometimes I contribute to them.',
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
  const LanguagesWidget({Key key}) : super(key: key);

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
                    'I has the privilege to live in some places and learn some languages',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Spanish: Native',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Sniglet'),
                  ),
                  Text(
                    'Portuguese: C2',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Sniglet'),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                'English: A2',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Sniglet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text('Let\'s talk?'),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => openApp('mailto:deandreamatias@gmail.com'),
                    child: Text(
                      'Email',
                      style: TextStyle(fontFamily: 'Sniglet'),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => openLink(
                        'https://www.linkedin.com/in/deandreamatias/?locale=en_US'),
                    child: Text(
                      'LinkedIn',
                      style: TextStyle(fontFamily: 'Sniglet'),
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
  const StreamingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text(
                'You can find in this platfroms',
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
              const SizedBox(height: 8.0),
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
