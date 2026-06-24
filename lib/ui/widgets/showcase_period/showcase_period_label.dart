import 'package:flutter/widgets.dart';
import 'package:portfolio/data/models/showcase.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';
import 'package:portfolio/ui/style/context_extensions.dart';
import 'package:portfolio/ui/utils/showcase_period_resolver.dart';
import 'package:portfolio/ui/widgets/text/body_large_text.dart';

class ShowcasePeriodLabel extends StatelessWidget {
  const ShowcasePeriodLabel({
    required this.kind,
    required this.startDate,
    this.endDate,
    this.enterpriseName = '',
    super.key,
  });

  ShowcasePeriodLabel.fromShowcase(Showcase showcase, {super.key})
    : kind = showcase.isJob
          ? ShowcasePeriodKind.job
          : ShowcasePeriodKind.project,
      startDate = showcase.startDate,
      endDate = showcase.endDate,
      enterpriseName = showcase.enterprise;

  final ShowcasePeriodKind kind;
  final DateTime startDate;
  final DateTime? endDate;
  final String enterpriseName;

  @override
  Widget build(BuildContext context) {
    final label = buildShowcasePeriodMessage(
      l10n: AppLocalizations.of(context),
      kind: kind,
      startDate: startDate,
      endDate: endDate,
      enterpriseName: enterpriseName,
    );

    return Semantics(
      label: label,
      child: BodyLargeText(label, color: context.appColors.onSurface),
    );
  }
}
