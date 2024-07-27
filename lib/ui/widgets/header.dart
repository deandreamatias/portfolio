import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/core/utils/constants.dart';
import 'package:portfolio/ui/shared/media_query_extension.dart';
import 'package:portfolio/ui/widgets/text/body_medium_text.dart';
import 'package:portfolio/ui/widgets/text/display_large_text.dart';
import 'package:portfolio/ui/widgets/username.dart';

class Header extends StatelessWidget {
  const Header({super.key});

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
          const Padding(
            padding: EdgeInsets.all(16),
            child: DisplayLargeText(Constants.name),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 4,
            runSpacing: 8,
            children:
                skills.map((String skill) => BodyMediumText(skill)).toList(),
          ),
        ],
      ),
    );
  }
}
