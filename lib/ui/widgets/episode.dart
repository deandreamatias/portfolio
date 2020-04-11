import 'package:flutter/material.dart';
import 'package:eof_podcast_feed/eof_podcast_feed.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../core/utils/navigate_links.dart';
import 'circular_image.dart';

class EpisodeWidget extends StatelessWidget {
  const EpisodeWidget({Key key, this.episode}) : super(key: key);
  final EOFEpisode episode;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child: Text(episode.title)),
                const SizedBox(width: 8),
                CircularImage(image: episode.cover),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Html(
                  data: episode.description,
                  onLinkTap: (String link) => openLink(link),
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
                //   onPressed: () => openLink(episode.link),
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
      ),
    );
  }
}
