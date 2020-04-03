import 'package:flutter/material.dart';

import '../core/utils/constants.dart';
import 'views/main_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.MAIN:
        return MaterialPageRoute<MainView>(builder: (_) => MainView());
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
