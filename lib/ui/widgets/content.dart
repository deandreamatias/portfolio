import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/ui/shared/media_query_extension.dart';
import 'package:portfolio/ui/widgets/text/body_medium_text.dart';
import 'package:portfolio/ui/widgets/text/title_large_text.dart';

class ContentModel {
  final String title;
  final List<String> content;

  const ContentModel({
    required this.title,
    this.content = const [],
  })  : assert(content.length > 0, 'Content must not be empty'),
        assert(title.length > 0, 'Title must not be empty');
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ContentModel> content = [
      ContentModel(
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
      ContentModel(
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
      ContentModel(
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
      ContentModel(
        title: AppLocalizations.of(context)!.when_title,
        content: [
          AppLocalizations.of(context)!.when_age(29),
          AppLocalizations.of(context)!.when_work,
          AppLocalizations.of(context)!.when_balance,
        ],
      ),
    ];
    return context.isMedium
        ? SizedBox(
            width: context.isExtraLarge ? 1440 : double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(child: _ColumnContent(contentModel: content[0])),
                Flexible(child: _ColumnContent(contentModel: content[1])),
                Flexible(child: _ColumnContent(contentModel: content[2])),
                Flexible(child: _ColumnContent(contentModel: content[3])),
              ],
            ),
          )
        : Column(
            children: <Widget>[
              _ExpansionTileContent(contentModel: content[0]),
              _ExpansionTileContent(contentModel: content[1]),
              _ExpansionTileContent(contentModel: content[2]),
              _ExpansionTileContent(contentModel: content[3])
            ],
          );
  }
}

class _ColumnContent extends StatelessWidget {
  final ContentModel contentModel;
  const _ColumnContent({required this.contentModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: TitleLargeText(contentModel.title),
          ),
          const SizedBox(height: 8),
          for (final String item in contentModel.content)
            Padding(
              padding: const EdgeInsets.all(8),
              child: BodyMediumText(item),
            ),
        ],
      ),
    );
  }
}

class _ExpansionTileContent extends StatelessWidget {
  final ContentModel contentModel;
  const _ExpansionTileContent({required this.contentModel});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      title: TitleLargeText(contentModel.title),
      children: <Widget>[
        for (final String item in contentModel.content)
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: BodyMediumText(item),
            ),
          ),
      ],
    );
  }
}
