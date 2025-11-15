import 'package:flutter/material.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/shared/constants.dart';
import 'package:portfolio/shared/sizes.dart';
import 'package:portfolio/widgets/text/body_medium_text.dart';
import 'package:portfolio/widgets/text/display_large_text.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> skills = [
      AppLocalizations.of(context).skills_one,
      Constants.separator,
      AppLocalizations.of(context).skills_two,
      Constants.separator,
      AppLocalizations.of(context).skills_three,
      Constants.separator,
      AppLocalizations.of(context).skills_four,
      Constants.separator,
      AppLocalizations.of(context).skills_five,
    ];
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(Sizes.large),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(Sizes.large),
                child: DisplayLargeText(Constants.name),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 4,
                runSpacing: 8,
                children: skills
                    .map((String skill) => BodyMediumText(skill))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
