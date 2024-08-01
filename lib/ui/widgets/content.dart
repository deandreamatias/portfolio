import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/core/utils/constants.dart';
import 'package:portfolio/core/utils/navigate_links.dart';
import 'package:portfolio/ui/shared/context_extensions.dart';
import 'package:portfolio/ui/shared/sizes.dart';
import 'package:portfolio/ui/widgets/text/body_large_text.dart';
import 'package:portfolio/ui/widgets/text/body_small_text.dart';
import 'package:portfolio/ui/widgets/text/title_large_text.dart';
import 'package:unicons/unicons.dart';

class ContentModel {
  final String title;
  final List<SubContentModel> content;
  final Color color;

  const ContentModel({
    required this.title,
    this.content = const [],
    required this.color,
  })  : assert(content.length > 0, 'Content must not be empty'),
        assert(title.length > 0, 'Title must not be empty');
}

class SubContentModel {
  final String title;
  final String subtitle;
  final List<Uri> urls;
  final List<IconData> urlIcons;
  final String info;

  const SubContentModel({
    required this.title,
    this.subtitle = '',
    this.urls = const [],
    this.info = '',
    this.urlIcons = const [],
  }) : assert(title.length > 0, 'Title must not be empty');
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ContentModel> content = [
      ContentModel(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        title: AppLocalizations.of(context)!.who_title,
        content: [
          SubContentModel(title: AppLocalizations.of(context)!.who_is_mobile),
          SubContentModel(title: AppLocalizations.of(context)!.who_communities),
          SubContentModel(title: AppLocalizations.of(context)!.who_writer),
          SubContentModel(title: AppLocalizations.of(context)!.who_podcast),
          SubContentModel(
            title: AppLocalizations.of(context)!.who_football,
            subtitle: AppLocalizations.of(context)!.who_secondary_football,
          ),
          SubContentModel(
            title: AppLocalizations.of(context)!.who_nationality,
            subtitle: AppLocalizations.of(context)!.who_secondary_nationality,
          ),
          SubContentModel(title: AppLocalizations.of(context)!.who_family),
          SubContentModel(title: AppLocalizations.of(context)!.who_pets)
        ],
      ),
      ContentModel(
        color: Theme.of(context).colorScheme.surfaceContainer,
        title: AppLocalizations.of(context)!.what_title,
        content: [
          SubContentModel(title: AppLocalizations.of(context)!.what_mobile),
          SubContentModel(title: AppLocalizations.of(context)!.what_contribute),
          SubContentModel(title: AppLocalizations.of(context)!.what_videos),
          SubContentModel(title: AppLocalizations.of(context)!.what_writing),
          SubContentModel(title: AppLocalizations.of(context)!.what_podcast),
          SubContentModel(title: AppLocalizations.of(context)!.what_languages),
          SubContentModel(title: AppLocalizations.of(context)!.what_pets),
        ],
      ),
      ContentModel(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        title: AppLocalizations.of(context)!.where_title,
        content: [
          SubContentModel(title: AppLocalizations.of(context)!.where_live),
          SubContentModel(
            title: AppLocalizations.of(context)!.where_work,
            urls: [Uri.parse(Urls.linkedin)],
            urlIcons: [UniconsLine.linkedin],
          ),
          SubContentModel(
            title: AppLocalizations.of(context)!.where_contribute,
            urls: [Uri.parse(Urls.github), Uri.parse(Urls.stackoverflow)],
            urlIcons: [UniconsLine.github, UniconsLine.comments],
          ),
          SubContentModel(
            title: AppLocalizations.of(context)!.where_videos,
            urls: [Uri.parse(Urls.youtube)],
            urlIcons: [UniconsLine.youtube],
          ),
          SubContentModel(
            title: AppLocalizations.of(context)!.where_communities,
            urls: [Uri.parse(Urls.stackoverflow)],
            urlIcons: [UniconsLine.users_alt],
          ),
          SubContentModel(
            title: AppLocalizations.of(context)!.where_writing,
            urls: [Uri.parse(Urls.medium)],
            urlIcons: [UniconsLine.medium_m],
          ),
          SubContentModel(
            title: AppLocalizations.of(context)!.where_podcast,
            urls: [
              Uri.parse(Urls.podcast),
              Uri.parse(Urls.podcastParticipations)
            ],
            urlIcons: [UniconsLine.microphone, UniconsLine.headphones],
          ),
          SubContentModel(
            title: AppLocalizations.of(context)!.where_football,
            urls: [Uri.parse(Urls.ondaFC)],
            urlIcons: [UniconsLine.football],
          ),
          SubContentModel(
            title: AppLocalizations.of(context)!.where_family_and_pets,
            urls: [Uri.parse(Urls.bluesky)],
            urlIcons: [UniconsLine.at],
          )
        ],
      ),
      ContentModel(
        color: Theme.of(context).colorScheme.surfaceContainer,
        title: AppLocalizations.of(context)!.when_title,
        content: [
          SubContentModel(title: AppLocalizations.of(context)!.when_age(29)),
          SubContentModel(title: AppLocalizations.of(context)!.when_work),
          SubContentModel(title: AppLocalizations.of(context)!.when_balance),
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
                  .map((contentModel) => Expanded(
                        child: _ColumnContent(contentModel: contentModel),
                      ))
                  .toList(),
            ),
          )
        : Column(
            children: content
                .map((contentModel) =>
                    _ExpansionTileContent(contentModel: contentModel))
                .toList(),
          );
  }
}

class _ColumnContent extends StatelessWidget {
  final ContentModel contentModel;
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
            for (final SubContentModel item in contentModel.content)
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
  final ContentModel contentModel;
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
        for (final SubContentModel item in widget.contentModel.content)
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

  final SubContentModel subcontentModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BodyLargeText(subcontentModel.title),
              if (subcontentModel.subtitle.isNotEmpty)
                BodySmallText(subcontentModel.subtitle),
            ],
          ),
        ),
        if (subcontentModel.urls.isNotEmpty &&
            subcontentModel.urlIcons.isNotEmpty)
          Row(
            children: [
              for (int i = 0; i < subcontentModel.urls.length; i++)
                IconButton(
                  onPressed: () => openLink(subcontentModel.urls[i]),
                  icon: Icon(subcontentModel.urlIcons[i]),
                )
            ],
          )
      ],
    );
  }
}
