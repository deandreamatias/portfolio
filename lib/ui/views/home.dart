import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/ui/shared/media_query_extension.dart';

import '../../core/utils/constants.dart';
import '../widgets/username.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Expanded(child: Column(children: [_Header(), _LargeContent()])),
          if (context.isSmall)
            const Align(alignment: Alignment.bottomCenter, child: Username())
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final List<String> skills = [
      AppLocalizations.of(context)!.skills_one,
      Constants.separator,
      AppLocalizations.of(context)!.skills_two,
      Constants.separator,
      AppLocalizations.of(context)!.skills_three,
      Constants.separator,
      AppLocalizations.of(context)!.skills_four,
      Constants.separator,
      AppLocalizations.of(context)!.skills_five,
    ];
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (context.isLarge)
            const Align(alignment: Alignment.topRight, child: Username()),
          const Name(),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 4,
            runSpacing: 8,
            children: skills.map((String skill) => Text(skill)).toList(),
          ),
        ],
      ),
    );
  }
}

class _LargeContent extends StatelessWidget {
  const _LargeContent();

  @override
  Widget build(BuildContext context) {
    return context.isMedium
        ? Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
          )
        : Column(children: <Widget>[
            Text(
              AppLocalizations.of(context)!.who_title,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            Text(
              AppLocalizations.of(context)!.what_title,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            Text(
              AppLocalizations.of(context)!.where_title,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            Text(
              AppLocalizations.of(context)!.when_title,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ]);
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
      padding: const EdgeInsets.all(16),
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
