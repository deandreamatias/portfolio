import 'package:flutter/material.dart';
import 'package:eof_podcast_feed/eof_podcast_feed.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/portfolio_icons.dart';
import 'card.dart';
import 'circular_image.dart';

class EpisodeWidget extends StatelessWidget {
  const EpisodeWidget({Key key, this.episode}) : super(key: key);
  final EOFEpisode episode;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(episode.title),
              CircularImage(image: episode.cover),
            ],
          ),
          Text(episode.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(episode.pubDate),
              RaisedButton.icon(
                onPressed: () async {
                  if (await canLaunch(episode.url)) {
                    await launch(episode.url);
                  } else {
                    throw 'Could not launch ${episode.url}';
                  }
                },
                icon: Icon(CustomIcons.github),
                label: Text(
                  'Compartir',
                  style: TextStyle(fontFamily: 'Sniglet'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
