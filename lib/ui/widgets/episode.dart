import 'package:flutter/material.dart';
import 'package:eof_podcast_feed/eof_podcast_feed.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

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
              Flexible(flex: 4, child: Text(episode.title)),
              Flexible(flex: 1, child: CircularImage(image: episode.cover)),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Html(
                data: episode.description,
                onLinkTap: (String link) async {
                  if (await canLaunch(link)) {
                    await launch(link);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(episode.pubDate),
              // TODO: Create share menu with options. Mobile and desktop
              // RaisedButton.icon(
              //   onPressed: () async {
              //     if (await canLaunch(episode.link)) {
              //       await launch(episode.link);
              //     } else {
              //       throw 'Could not launch ${episode.link}';
              //     }
              //   },
              //   icon: Icon(CustomIcons.github),
              //   label: Text(
              //     'Compartir',
              //     style: TextStyle(fontFamily: 'Sniglet'),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
