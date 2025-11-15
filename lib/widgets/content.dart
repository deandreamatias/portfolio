import 'package:flutter/material.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/shared/constants.dart';
import 'package:portfolio/shared/context_extensions.dart';
import 'package:portfolio/shared/sizes.dart';
import 'package:portfolio/widgets/link_text.dart';
import 'package:portfolio/widgets/text/body_large_text.dart';
import 'package:portfolio/widgets/text/body_small_text.dart';
import 'package:portfolio/widgets/text/title_large_text.dart';
import 'package:unicons/unicons.dart';

class ColumnModel {
  final String title;
  final List<ContentModel> content;
  final Color color;

  const ColumnModel({
    required this.title,
    this.content = const [],
    required this.color,
  }) : assert(content.length > 0, 'Content must not be empty'),
       assert(title.length > 0, 'Title must not be empty');
}

class ContentModel {
  final String title;
  final String subtitle;
  final Map<String, Uri> urls;
  final String infoId;

  const ContentModel({
    required this.title,
    this.subtitle = '',
    this.urls = const {},
    this.infoId = '',
  }) : assert(title.length > 0, 'Title must not be empty');
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ColumnModel> content = [
      ColumnModel(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        title: AppLocalizations.of(context).who_title,
        content: [
          ContentModel(title: AppLocalizations.of(context).who_is_mobile),
          ContentModel(title: AppLocalizations.of(context).who_communities),
          ContentModel(title: AppLocalizations.of(context).who_writer),
          ContentModel(title: AppLocalizations.of(context).who_podcast),
          ContentModel(
            title: AppLocalizations.of(context).who_football,
            subtitle: AppLocalizations.of(context).who_secondary_football,
          ),
          ContentModel(
            title: AppLocalizations.of(context).who_nationality,
            subtitle: AppLocalizations.of(context).who_secondary_nationality,
          ),
          ContentModel(title: AppLocalizations.of(context).who_family),
          ContentModel(title: AppLocalizations.of(context).who_pets),
        ],
      ),
      ColumnModel(
        color: Theme.of(context).colorScheme.surfaceContainer,
        title: AppLocalizations.of(context).what_title,
        content: [
          ContentModel(title: AppLocalizations.of(context).what_mobile),
          ContentModel(title: AppLocalizations.of(context).what_contribute),
          ContentModel(title: AppLocalizations.of(context).what_videos),
          ContentModel(title: AppLocalizations.of(context).what_writing),
          ContentModel(title: AppLocalizations.of(context).what_podcast),
          ContentModel(title: AppLocalizations.of(context).what_languages),
        ],
      ),
      ColumnModel(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        title: AppLocalizations.of(context).where_title,
        content: [
          ContentModel(title: AppLocalizations.of(context).where_live),
          ContentModel(
            title: AppLocalizations.of(context).where_work(UrlKeys.linkedIn),
            urls: {UrlKeys.linkedIn: Uri.parse(Urls.linkedin)},
          ),
          ContentModel(
            title: AppLocalizations.of(
              context,
            ).where_contribute(UrlKeys.gitHub, UrlKeys.stackOverflow),
            urls: {
              UrlKeys.gitHub: Uri.parse(Urls.github),
              UrlKeys.stackOverflow: Uri.parse(Urls.stackoverflow),
            },
          ),
          ContentModel(
            title: AppLocalizations.of(context).where_videos(UrlKeys.youtube),
            urls: {UrlKeys.youtube: Uri.parse(Urls.youtube)},
          ),
          ContentModel(title: AppLocalizations.of(context).where_communities),
          ContentModel(
            title: AppLocalizations.of(context).where_writing(UrlKeys.medium),
            urls: {UrlKeys.medium: Uri.parse(Urls.medium)},
          ),
          ContentModel(
            title: AppLocalizations.of(context).where_podcast(
              AppLocalizations.of(context).where_podcast_participation,
              UrlKeys.universoFlutter,
            ),
            urls: {
              UrlKeys.universoFlutter: Uri.parse(Urls.podcast),
              AppLocalizations.of(context).where_podcast_participation:
                  Uri.parse(Urls.podcastParticipations),
            },
          ),
          ContentModel(
            title: AppLocalizations.of(context).where_football(UrlKeys.ondaFC),
            urls: {UrlKeys.ondaFC: Uri.parse(Urls.ondaFC)},
          ),
          ContentModel(
            title: AppLocalizations.of(
              context,
            ).where_family_and_pets(UrlKeys.blueSky),
            urls: {UrlKeys.blueSky: Uri.parse(Urls.bluesky)},
          ),
        ],
      ),
      ColumnModel(
        color: Theme.of(context).colorScheme.surfaceContainer,
        title: AppLocalizations.of(context).when_title,
        content: [
          ContentModel(title: AppLocalizations.of(context).when_age(29)),
          ContentModel(title: AppLocalizations.of(context).when_work),
          ContentModel(title: AppLocalizations.of(context).when_balance),
        ],
      ),
    ];
    return context.isMedium
        ? SizedBox(
            width: context.isExtraLarge ? 1440 : double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: content
                  .map(
                    (contentModel) => Expanded(
                      child: _ColumnContent(contentModel: contentModel),
                    ),
                  )
                  .toList(),
            ),
          )
        : Column(
            children: content
                .map(
                  (contentModel) =>
                      _ExpansionTileContent(contentModel: contentModel),
                )
                .toList(),
          );
  }
}

class _ColumnContent extends StatelessWidget {
  final ColumnModel contentModel;
  const _ColumnContent({required this.contentModel});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: contentModel.color,
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: TitleLargeText(contentModel.title),
            ),
            const SizedBox(height: Sizes.medium),
            for (final ContentModel item in contentModel.content)
              Padding(
                padding: const EdgeInsets.all(Sizes.medium),
                child: _ContentItem(subcontentModel: item),
              ),
          ],
        ),
      ),
    );
  }
}

class _ExpansionTileContent extends StatefulWidget {
  final ColumnModel contentModel;
  const _ExpansionTileContent({required this.contentModel});

  @override
  State<_ExpansionTileContent> createState() => _ExpansionTileContentState();
}

class _ExpansionTileContentState extends State<_ExpansionTileContent> {
  final ValueNotifier<bool> isExpanded = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (bool value) {
        isExpanded.value = value;
      },
      childrenPadding: const EdgeInsets.symmetric(
        vertical: Sizes.medium,
        horizontal: Sizes.large,
      ),
      trailing: ValueListenableBuilder(
        valueListenable: isExpanded,
        builder: (context, value, child) => value
            ? const Icon(UniconsLine.angle_down)
            : const Icon(UniconsLine.angle_up),
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      collapsedBackgroundColor: widget.contentModel.color,
      backgroundColor: widget.contentModel.color,
      shape: const RoundedRectangleBorder(),
      title: TitleLargeText(widget.contentModel.title),
      children: <Widget>[
        for (final ContentModel item in widget.contentModel.content)
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.all(Sizes.small),
              child: _ContentItem(subcontentModel: item),
            ),
          ),
      ],
    );
  }
}

class _ContentItem extends StatelessWidget {
  const _ContentItem({required this.subcontentModel});

  final ContentModel subcontentModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              subcontentModel.urls.isEmpty
                  ? BodyLargeText(subcontentModel.title)
                  : LinkText(
                      text: subcontentModel.title,
                      links: subcontentModel.urls,
                    ),
              if (subcontentModel.subtitle.isNotEmpty)
                BodySmallText(subcontentModel.subtitle),
            ],
          ),
        ),
        if (subcontentModel.infoId.isNotEmpty)
          IconButton(
            onPressed: () => {},
            icon: const Icon(UniconsLine.info_circle),
          ),
      ],
    );
  }
}
