import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';
import 'package:unicons/unicons.dart';

void main() {
  group('Home navigation responsiveness', () {
    testWidgets('Desktop shows all four navigation options', (
      WidgetTester tester,
    ) async {
      final TestWidgetsFlutterBinding binding =
          TestWidgetsFlutterBinding.ensureInitialized();
      binding.platformDispatcher.views.single
        ..physicalSize = const Size(1280, 900)
        ..devicePixelRatio = 1;
      addTearDown(() {
        binding.platformDispatcher.views.single.resetPhysicalSize();
        binding.platformDispatcher.views.single.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      expect(find.text('Projects'), findsOneWidget);
      expect(find.text('Career'), findsOneWidget);
      expect(find.text('About me'), findsOneWidget);
      expect(find.text('Contact'), findsOneWidget);
    });

    testWidgets('Desktop navigation opens placeholder route', (
      WidgetTester tester,
    ) async {
      final TestWidgetsFlutterBinding binding =
          TestWidgetsFlutterBinding.ensureInitialized();
      binding.platformDispatcher.views.single
        ..physicalSize = const Size(1280, 900)
        ..devicePixelRatio = 1;
      addTearDown(() {
        binding.platformDispatcher.views.single.resetPhysicalSize();
        binding.platformDispatcher.views.single.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Contact'));
      await tester.pumpAndSettle();

      expect(find.text('Contact section coming soon'), findsOneWidget);
    });

    testWidgets('Mobile shows PageView and swipe changes page', (
      WidgetTester tester,
    ) async {
      final TestWidgetsFlutterBinding binding =
          TestWidgetsFlutterBinding.ensureInitialized();
      binding.platformDispatcher.views.single
        ..physicalSize = const Size(390, 844)
        ..devicePixelRatio = 1;
      addTearDown(() {
        binding.platformDispatcher.views.single.resetPhysicalSize();
        binding.platformDispatcher.views.single.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      expect(find.byType(PageView), findsOneWidget);
      expect(find.text('Projects'), findsOneWidget);
      // On first page: no left arrow, right arrow is visible
      expect(find.byIcon(UniconsLine.angle_left), findsNothing);
      expect(find.byIcon(UniconsLine.angle_right), findsOneWidget);

      await tester.fling(find.byType(PageView), const Offset(-300, 0), 1000);
      await tester.pumpAndSettle();

      expect(find.text('Career'), findsOneWidget);
    });
  });
}
