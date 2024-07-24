import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../core/utils/constants.dart';
import '../widgets/custom_cards.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/menu.dart';

class HomeView extends StatefulWidget {
  static const String route = '/';
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: MenuWidget(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ResponsiveBuilder(
              builder:
                  (BuildContext context, SizingInformation sizingInformation) {
                switch (sizingInformation.deviceScreenType) {
                  case DeviceScreenType.desktop:
                    return const _LargeContent();
                  default:
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            HeaderWidget(
                              title:
                                  AppLocalizations.of(context)!.homeHeaderTitle,
                              subtitle: AppLocalizations.of(context)!
                                  .homeHeaderSubtitle,
                              image: Urls.profile,
                              key: const Key(Urls.profile),
                            ),
                            const GithubWidget(),
                            const SkillsWidget(),
                            const LanguagesWidget(),
                            const ContactWidget(),
                          ],
                        ),
                      ),
                    );
                }
              },
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Footer(),
          )
        ],
      ),
    );
  }
}

class _LargeContent extends StatelessWidget {
  const _LargeContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: ColumnContent(
            title: AppLocalizations.of(context)!.who_title,
            content: [
              AppLocalizations.of(context)!.who_is_mobile,
              AppLocalizations.of(context)!.who_communities,
              AppLocalizations.of(context)!.who_writer,
              AppLocalizations.of(context)!.who_podcast,
              AppLocalizations.of(context)!.who_football,
              AppLocalizations.of(context)!.who_secondary_football,
              AppLocalizations.of(context)!.who_nationality,
              AppLocalizations.of(context)!.who_secondary_nationality,
              AppLocalizations.of(context)!.who_family,
              AppLocalizations.of(context)!.who_pets,
            ],
          ),
        ),
        Flexible(
          child: ColumnContent(
            title: AppLocalizations.of(context)!.what_title,
            content: [
              AppLocalizations.of(context)!.what_mobile,
              AppLocalizations.of(context)!.what_contribute,
              AppLocalizations.of(context)!.what_videos,
              AppLocalizations.of(context)!.what_writing,
              AppLocalizations.of(context)!.what_podcast,
              AppLocalizations.of(context)!.what_languages,
              AppLocalizations.of(context)!.what_pets,
            ],
          ),
        ),
        Flexible(
          child: ColumnContent(
            title: AppLocalizations.of(context)!.where_title,
            content: [
              AppLocalizations.of(context)!.where_live,
              AppLocalizations.of(context)!.where_work,
              AppLocalizations.of(context)!.where_contribute,
              AppLocalizations.of(context)!.where_videos,
              AppLocalizations.of(context)!.where_communities,
              AppLocalizations.of(context)!.where_writing,
              AppLocalizations.of(context)!.where_podcast,
              AppLocalizations.of(context)!.where_football,
              AppLocalizations.of(context)!.where_family_and_pets,
            ],
          ),
        ),
        Flexible(
          child: ColumnContent(
            title: AppLocalizations.of(context)!.when_title,
            content: [
              AppLocalizations.of(context)!.when_age(29),
              AppLocalizations.of(context)!.when_work,
              AppLocalizations.of(context)!.when_balance,
            ],
          ),
        ),
      ],
    );
  }
}

class ColumnContent extends StatelessWidget {
  final String title;
  final List<String> content;
  const ColumnContent({
    super.key,
    required this.title,
    this.content = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
          for (final String item in content)
            Padding(padding: const EdgeInsets.all(8.0), child: Text(item)),
        ],
      ),
    );
  }
}
