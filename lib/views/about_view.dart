import 'package:flutter/material.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/views/section_placeholder_view.dart';

class AboutView extends StatelessWidget {
  static const String route = '/about';

  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return SectionPlaceholderView(
      title: l10n.navAboutMe,
      message: l10n.sectionComingSoon(l10n.navAboutMe),
    );
  }
}
