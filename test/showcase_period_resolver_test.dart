import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/ui/utils/showcase_period_resolver.dart';

void main() {
  group('resolveShowcasePeriodVariant', () {
    final referenceDate = DateTime(2026, 6, 4);

    test('returns ongoing when end date is null', () {
      final variant = resolveShowcasePeriodVariant(
        startDate: DateTime(2024),
        endDate: null,
        referenceDate: referenceDate,
      );

      expect(variant, ShowcasePeriodVariant.ongoing);
    });

    test('returns ongoing when end date is in the future', () {
      final variant = resolveShowcasePeriodVariant(
        startDate: DateTime(2024),
        endDate: DateTime(2026, 7),
        referenceDate: referenceDate,
      );

      expect(variant, ShowcasePeriodVariant.ongoing);
    });

    test('returns same month when finished in the start month', () {
      final variant = resolveShowcasePeriodVariant(
        startDate: DateTime(2024, 2),
        endDate: DateTime(2024, 2, 29),
        referenceDate: referenceDate,
      );

      expect(variant, ShowcasePeriodVariant.finishedSameMonth);
    });

    test('returns same year when finished in another month that year', () {
      final variant = resolveShowcasePeriodVariant(
        startDate: DateTime(2024, 2),
        endDate: DateTime(2024, 11),
        referenceDate: referenceDate,
      );

      expect(variant, ShowcasePeriodVariant.finishedSameYear);
    });

    test('returns cross year when finished in another year', () {
      final variant = resolveShowcasePeriodVariant(
        startDate: DateTime(2023, 11),
        endDate: DateTime(2024, 2),
        referenceDate: referenceDate,
      );

      expect(variant, ShowcasePeriodVariant.finishedCrossYear);
    });

    test('does not depend on showcase kind', () {
      final projectVariant = resolveShowcasePeriodVariant(
        startDate: DateTime(2023, 11),
        endDate: DateTime(2024, 2),
        referenceDate: referenceDate,
      );
      final jobVariant = resolveShowcasePeriodVariant(
        startDate: DateTime(2023, 11),
        endDate: DateTime(2024, 2),
        referenceDate: referenceDate,
      );

      expect(projectVariant, ShowcasePeriodVariant.finishedCrossYear);
      expect(jobVariant, ShowcasePeriodVariant.finishedCrossYear);
    });
  });
}
