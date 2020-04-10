import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:eof_podcast_feed/eof_podcast_feed.dart';

import '../../core/utils/constants.dart';
import '../widgets/custom_cards.dart';
import '../widgets/episode.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/menu.dart';

class PodcastView extends StatelessWidget {
  PodcastView({Key key}) : super(key: key);
  static const String route = '/podcast';
  double childAspectRatio = 1.0;
  double maxCrossAxisExtent = 500.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0),
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
                              title: 'Hi, this is Universo Flutter',
                              subtitle:
                                  'This is my podcast about Flutter and the main language is portuguese',
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
                              title: 'Hi, this is Universo Flutter',
                              subtitle:
                                  'This is my podcast about Flutter and the main language is portuguese',
                              image: snapshot.data.podcastCoverUrl,
                            ),
                            const StreamingWidget(),
                          ],
                        ),
                        desktop: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            HeaderWidget(
                              title: 'Hi, this is Universo Flutter',
                              subtitle:
                                  'This is my podcast about Flutter and the main language is portuguese',
                              image: snapshot.data.podcastCoverUrl,
                            ),
                            const StreamingWidget(),
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
                        child: const Footer(),
                      )
                    ],
                  );
                },
              );
              break;
            default:
              return Center(child: Text('Error to load data'));
          }
        },
      ),
    );
  }
}
