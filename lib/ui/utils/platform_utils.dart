import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class PlatformUtils {
  /// Executing on: `web` with SO `Android` or `iOS`.
  static bool get isMobileBrowser => kIsWeb && PlatformUtils.isMobileSystem;

  /// Executing on: app with SO `Android` or `iOS`.
  ///
  /// Never executing on: `web`.
  static bool get isMobileApp => !kIsWeb && PlatformUtils.isMobileSystem;

  /// Executing on: `Android` or `iOS`.
  ///
  /// Does not matter if is app or web.
  static bool get isMobileSystem =>
      PlatformUtils.isIOS || PlatformUtils.isAndroid;

  /// Executing on: `MacOS` or `Windows` or `Linux`.
  ///
  /// Does not matter if is app or web.
  static bool get isDesktopSystem =>
      PlatformUtils.isMacOS || PlatformUtils.isWindows || PlatformUtils.isLinux;

  /// Executing on: `Android`.
  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  /// Executing on: `iOS`.
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  /// Executing on: `MacOS`.
  static bool get isMacOS => defaultTargetPlatform == TargetPlatform.macOS;

  /// Executing on: `Linux`.
  static bool get isLinux => defaultTargetPlatform == TargetPlatform.linux;

  /// Executing on: `Windows`.
  static bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;

  /// Executing on: `web`.
  static bool get isWeb => kIsWeb;
}
