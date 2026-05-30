import 'package:flutter/widgets.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/shared/constants.dart';
import 'package:portfolio/widgets/link_button.dart';

class LinkedinButton extends StatelessWidget {
  const LinkedinButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LinkButton(
      label: AppLocalizations.of(context).cv_button,
      url: Uri.parse(Urls.linkedin),
    );
  }
}
