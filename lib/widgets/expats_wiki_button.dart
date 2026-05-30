import 'package:flutter/widgets.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/shared/constants.dart';
import 'package:portfolio/widgets/link_button.dart';

class ExpatsWikiButton extends StatelessWidget {
  const ExpatsWikiButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LinkButton(
      label: AppLocalizations.of(context).brazil_tech_expats,
      url: Uri.parse(Urls.brazilTechExpats),
    );
  }
}
