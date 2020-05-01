import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:eof_podcast_feed/eof_podcast_feed.dart';

import 'package:portfolio/core/data/streamigs.dart';
import 'package:portfolio/core/utils/navigate_links.dart';
import 'package:portfolio/ui/shared/portfolio_icons.dart';
import 'package:portfolio/ui/widgets/circular_image.dart';
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
    double minHeight = 200;
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
                      minHeight = 120;
                      break;
                    case DeviceScreenType.Mobile:
                      childAspectRatio = 1.5;
                      maxCrossAxisExtent = 550.0;
                      minHeight = 140;
                      break;
                    case DeviceScreenType.Tablet:
                      childAspectRatio = 1.25;
                      maxCrossAxisExtent = 550.0;
                      minHeight = 200;
                      break;
                    case DeviceScreenType.Desktop:
                      childAspectRatio = 1.5;
                      maxCrossAxisExtent = 550.0;
                      minHeight = 200;
                      break;
                    default:
                      childAspectRatio = 1.5;
                      maxCrossAxisExtent = 550.0;
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: CustomScrollView(
                          physics: const BouncingScrollPhysics(),
                          slivers: <Widget>[
                            SliverPersistentHeader(
                              pinned: true,
                              delegate: _SliverAppBarDelegate(
                                maxHeight: minHeight,
                                minHeight: minHeight,
                                child: buildScreenTypeLayout(snapshot, context),
                              ),
                            ),
                            SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                childAspectRatio: childAspectRatio,
                                maxCrossAxisExtent: maxCrossAxisExtent,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) =>
                                    EpisodeWidget(
                                  episode: snapshot.data.episodes[index],
                                ),
                                childCount: snapshot.data.episodes.length,
                              ),
                            ),
                          ],
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

  Widget buildScreenTypeLayout(
      AsyncSnapshot<EOFPodcast> snapshot, BuildContext context) {
    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(
        tablet: 600,
        desktop: 900,
        watch: 400,
      ),
      mobile: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Text(
                  translate('podcast.title') +
                      ', ' +
                      translate('podcast.subtitle'),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              CircularImage(
                image: snapshot.data.podcastCoverUrl,
                button: IconButton(
                  tooltip: translate('podcast.streaming.button_streaming'),
                  icon: const Icon(CustomIcons.headphones),
                  onPressed: () => showModalBottomSheet<Container>(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.vertical(
                          top: Radius.circular(30.0)),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 320,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(16.0),
                          itemCount: streamings.length,
                          itemBuilder: (BuildContext context, int index) =>
                              ListTile(
                            title: Text(streamings[index].title),
                            onTap: () => openApp(streamings[index].url),
                            leading: Image.asset(streamings[index].image),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
        mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
