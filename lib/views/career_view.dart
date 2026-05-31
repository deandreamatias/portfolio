import 'package:flutter/widgets.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/views/section_placeholder_view.dart';

class CareerView extends StatelessWidget {
  static const String route = '/career';

  const CareerView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    return SectionPlaceholderView(
      title: l10n.navCareer,
      message: l10n.sectionComingSoon(l10n.navCareer),
    );
  }
}
