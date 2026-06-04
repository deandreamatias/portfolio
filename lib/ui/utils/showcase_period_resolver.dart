import 'package:intl/intl.dart';
import 'package:portfolio/l10n/gen_l10n/app_localizations.dart';

enum ShowcasePeriodKind { project, job }

enum ShowcasePeriodVariant {
  ongoing,
  finishedSameMonth,
  finishedSameYear,
  finishedCrossYear,
}

ShowcasePeriodVariant resolveShowcasePeriodVariant({
  required DateTime startDate,
  required DateTime? endDate,
  DateTime? referenceDate,
}) {
  final now = referenceDate ?? DateTime.now();
  if (endDate == null || endDate.isAfter(now)) {
    return ShowcasePeriodVariant.ongoing;
  }

  if (startDate.year == endDate.year && startDate.month == endDate.month) {
    return ShowcasePeriodVariant.finishedSameMonth;
  }

  if (startDate.year == endDate.year) {
    return ShowcasePeriodVariant.finishedSameYear;
  }

  return ShowcasePeriodVariant.finishedCrossYear;
}

String buildShowcasePeriodMessage({
  required AppLocalizations l10n,
  required ShowcasePeriodKind kind,
  required DateTime startDate,
  required DateTime? endDate,
  String enterpriseName = '',
  DateTime? referenceDate,
}) {
  assert(
    kind == ShowcasePeriodKind.project || enterpriseName.trim().isNotEmpty,
    'Job showcase period messages require an enterprise name.',
  );

  final variant = resolveShowcasePeriodVariant(
    startDate: startDate,
    endDate: endDate,
    referenceDate: referenceDate,
  );
  final effectiveEndDate = endDate ?? referenceDate ?? DateTime.now();
  final startMonth = DateFormat.MMMM(l10n.localeName).format(startDate);
  final endMonth = DateFormat.MMMM(l10n.localeName).format(effectiveEndDate);
  final startYear = DateFormat.y(l10n.localeName).format(startDate);
  final endYear = DateFormat.y(l10n.localeName).format(effectiveEndDate);

  return switch ((kind, variant)) {
    (ShowcasePeriodKind.project, ShowcasePeriodVariant.ongoing) =>
      l10n.showcasePeriodProjectMaintainedSince(startMonth, startYear),
    (ShowcasePeriodKind.project, ShowcasePeriodVariant.finishedSameMonth) =>
      l10n.showcasePeriodProjectDevelopedIn(startMonth, startYear),
    (ShowcasePeriodKind.project, ShowcasePeriodVariant.finishedSameYear) =>
      l10n.showcasePeriodProjectDevelopedBetweenMonthsSameYear(
        startMonth,
        endMonth,
        startYear,
      ),
    (ShowcasePeriodKind.project, ShowcasePeriodVariant.finishedCrossYear) =>
      l10n.showcasePeriodProjectDevelopedBetweenRange(
        startMonth,
        startYear,
        endMonth,
        endYear,
      ),
    (ShowcasePeriodKind.job, ShowcasePeriodVariant.ongoing) =>
      l10n.showcasePeriodJobCurrentlyAtSince(
        enterpriseName,
        startMonth,
        startYear,
      ),
    (ShowcasePeriodKind.job, ShowcasePeriodVariant.finishedSameMonth) =>
      l10n.showcasePeriodJobWorkedOnIn(enterpriseName, startMonth, startYear),
    (ShowcasePeriodKind.job, ShowcasePeriodVariant.finishedSameYear) =>
      l10n.showcasePeriodJobWorkedOnBetweenMonthsSameYear(
        enterpriseName,
        startMonth,
        endMonth,
        startYear,
      ),
    (ShowcasePeriodKind.job, ShowcasePeriodVariant.finishedCrossYear) =>
      l10n.showcasePeriodJobWorkedOnBetweenRange(
        enterpriseName,
        startMonth,
        startYear,
        endMonth,
        endYear,
      ),
  };
}
