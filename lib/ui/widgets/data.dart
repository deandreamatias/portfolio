import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/utils/constants.dart';
import '../shared/portfolio_icons.dart';
import '../shared/styles.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Text(
                'Hi, I\'m Matias de Andrea',
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),
            Container(
              child: CircleAvatar(
                backgroundImage: AssetImage(Assets.PROFILE),
              ),
              width: 70.0,
              height: 70.0,
              padding: const EdgeInsets.all(2.0), // borde width
              decoration: const BoxDecoration(
                color: ACCENT,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            'And also a creative and dynamic developer.\nI really like work with mobile applications, developing UI/UX and software.',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
class ContactWidget extends StatelessWidget {
  const ContactWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Let\'s talk?'),
        SizedBox(height: 8.0),
        RaisedButton(
          onPressed: () async {
            const String url = 'malito:deandreamatias@gmail.com';
            if (await canLaunch(url)) {
              await launch(url);
              print('Launched');
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Text('Send a email'),
        ),
      ],
    );
  }
}

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class GithubWidget extends StatelessWidget {
  const GithubWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton.icon(
          onPressed: () async {
            const String url = 'https://github.com/deandreamatias';
            if (await canLaunch(url)) {
              await launch(url);
              print('Launched');
            } else {
              throw 'Could not launch $url';
            }
          },
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
    );
  }
}

class LanguagesWidget extends StatelessWidget {
  const LanguagesWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

