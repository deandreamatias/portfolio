import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:eof_podcast_feed/eof_podcast_feed.dart';

import '../../core/utils/constants.dart';
import '../widgets/custom_cards.dart';
import '../widgets/episode.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/menu.dart';

class PodcastView extends StatelessWidget {
  static const String route = '/universoflutter';

  @override
  Widget build(BuildContext context) {
    double childAspectRatio = 1.0;
    double maxCrossAxisExtent = 500.0;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: MenuWidget(),
      ),
      body: FutureBuilder<EOFPodcast>(
        future: EOFPodcast.fromFeed(Urls.PODCAST),
        builder: (BuildContext context, AsyncSnapshot<EOFPodcast> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.done:
              return ResponsiveBuilder(
                breakpoints: ScreenBreakpoints(
                  tablet: 550,
                  desktop: 900,
                  watch: 400,
                ),
                builder: (BuildContext context,
                    SizingInformation sizingInformation) {
                  switch (sizingInformation.deviceScreenType) {
                    case DeviceScreenType.Watch:
                      childAspectRatio = 1.0;
                      maxCrossAxisExtent = 400.0;
                      break;
                    case DeviceScreenType.Mobile:
                      childAspectRatio = 1.5;
                      maxCrossAxisExtent = 550.0;
                      break;
                    case DeviceScreenType.Tablet:
                      childAspectRatio = 1.25;
                      maxCrossAxisExtent = 550.0;
                      break;
                    case DeviceScreenType.Desktop:
                      childAspectRatio = 1.5;
                      maxCrossAxisExtent = 550.0;
                      break;
                    default:
                      childAspectRatio = 1.5;
                      maxCrossAxisExtent = 550.0;
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ScreenTypeLayout(
                        mobile: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            HeaderWidget(
                              title: translate('podcast.title'),
                              subtitle: translate('podcast.subtitle'),
                              image: snapshot.data.podcastCoverUrl,
                              streaming: true,
                            ),
                          ],
                        ),
                        tablet: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            HeaderWidget(
                              title: translate('podcast.title'),
                              subtitle: translate('podcast.subtitle'),
                              image: snapshot.data.podcastCoverUrl,
                            ),
                            StreamingWidget(),
                          ],
                        ),
                        desktop: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            HeaderWidget(
                              title: translate('podcast.title'),
                              subtitle: translate('podcast.subtitle'),
                              image: snapshot.data.podcastCoverUrl,
                            ),
                            StreamingWidget(),
                          ],
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            childAspectRatio: childAspectRatio,
                            maxCrossAxisExtent: maxCrossAxisExtent,
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data.episodes.length,
                          itemBuilder: (BuildContext context, int index) =>
                              EpisodeWidget(
                            episode: snapshot.data.episodes[index],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Footer(),
                      )
                    ],
                  );
                },
              );
              break;
            default:
              return const Center(child: Text('Error to load data'));
          }
        },
      ),
    );
  }
}
