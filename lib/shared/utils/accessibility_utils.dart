import 'dart:math' show min, max;

import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/utils/platform_utils.dart';

class AccessibilityUtils {
  static void announce(BuildContext context, {required String message}) {
    assert(message.isNotEmpty, 'Message cannot be empty');
    if (MediaQuery.accessibleNavigationOf(context)) {
      // Workaround for iOS, because it doesn't announce the message
      // if it's called immediately
      // Ref: https://github.com/flutter/flutter/issues/122101
      PlatformUtils.isIOS
          ? Future.delayed(Duration(milliseconds: 100), () {
              if (context.mounted) _semanticsAnnounce(context, message);
            })
          : _semanticsAnnounce(context, message);
    }
  }

  static void _semanticsAnnounce(BuildContext context, String message) {
    SemanticsService.sendAnnouncement(
      View.of(context),
      message,
      Directionality.of(context),
    );
  }
}

extension AccessibilityGlobalKey on GlobalKey {
  /// Safety focus to the widget associated with the GlobalKey.
  /// See [FocusSemanticEvent](https://api.flutter.dev/flutter/semantics/FocusSemanticEvent-class.html) for more details.
  ///
  /// Encapsulated by `WidgetsBinding.instance.addPostFrameCallback`
  void get semanticsFocus => WidgetsBinding.instance.addPostFrameCallback((_) {
    currentContext?.findRenderObject()?.sendSemanticsEvent(
      const FocusSemanticEvent(),
    );
  });
}

extension AccessibilityTextStyle on TextStyle {
  TextStyle boldFontWeight(BuildContext context) {
    if (!MediaQuery.boldTextOf(context)) return this;
    return copyWith(fontWeight: fontWeight?.fixBold(context));
  }
}

extension AccessibilityFontWeightValue on FontWeight {
  FontWeight fixBold(BuildContext context) {
    if (!MediaQuery.boldTextOf(context)) return this;
    final result = min(
      max(value + 300, FontWeight.w100.value),
      FontWeight.w900.value,
    );
    return FontWeight.values.firstWhere(
      (element) => element.value == result,
      orElse: () => FontWeight.w400,
    );
  }
}
