import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';
import 'package:unicons/unicons.dart';

void main() {
  group('Accessibility Tests', () {
    setUp(() {
      final TestWidgetsFlutterBinding binding =
          TestWidgetsFlutterBinding.ensureInitialized();
      binding.platformDispatcher.views.single
        ..physicalSize = const Size(390, 844)
        ..devicePixelRatio = 1;
    });

    tearDown(() {
      final TestWidgetsFlutterBinding binding =
          TestWidgetsFlutterBinding.ensureInitialized();
      binding.platformDispatcher.views.single.resetPhysicalSize();
      binding.platformDispatcher.views.single.resetDevicePixelRatio();
    });

    testWidgets('HomeView should meet Android tap target guidelines', (
      WidgetTester tester,
    ) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
      handle.dispose();
    });

    testWidgets('HomeView should meet text contrast guidelines', (
      WidgetTester tester,
    ) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      await expectLater(tester, meetsGuideline(textContrastGuideline));
      handle.dispose();
    });

    testWidgets('Mobile navigation tiles should be discoverable', (
      WidgetTester tester,
    ) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      expect(find.byType(PageView), findsOneWidget);
      // Left arrow hidden on first page; right arrow visible since there are more options
      expect(find.byIcon(UniconsLine.angle_left), findsNothing);
      expect(find.byIcon(UniconsLine.angle_right), findsOneWidget);

      handle.dispose();
    });

    testWidgets('Header should be marked as header', (
      WidgetTester tester,
    ) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      expect(
        find.semantics.byFlag(SemanticsFlag.isHeader),
        findsAtLeastNWidgets(1),
      );
      handle.dispose();
    });
  });
}
