import 'package:flutter/widgets.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/views/section_placeholder_view.dart';

class ContactView extends StatelessWidget {
  static const String route = '/contact';

  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return SectionPlaceholderView(
      title: l10n.navContact,
      message: l10n.sectionComingSoon(l10n.navContact),
    );
  }
}
