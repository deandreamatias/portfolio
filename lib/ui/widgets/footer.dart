
import 'package:flutter/material.dart';
import 'package:portfolio/ui/shared/portfolio_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8.0),
        const Text('Valencia, Spain'),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(CustomIcons.linkedin),
              onPressed: () => _navigateLink(
                  'https://www.linkedin.com/in/deandreamatias/?locale=en_US'),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: Icon(CustomIcons.github),
              onPressed: () =>
                  _navigateLink('https://github.com/deandreamatias'),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: Icon(CustomIcons.behance),
              onPressed: () => _navigateLink(
                  'https://www.behance.net/deandreamatias'),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: Icon(CustomIcons.twitter),
              onPressed: () =>
                  _navigateLink('https://twitter.com/deandreamatias'),
            ),
          ],
        )
      ],
    );
  }
}

Future<void> _navigateLink(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
    print('Launched');
  } else {
    throw 'Could not launch $url';
  }
}