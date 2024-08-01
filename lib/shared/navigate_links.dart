import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
    log('Launched: $url');
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> openApp(Uri url) async {
  try {
    await launchUrl(url);
    log('Launched: ${url.toString()}');
  } catch (e) {
    throw 'Could not launch ${url.toString()} because $e';
  }
}
