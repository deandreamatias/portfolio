import 'package:flutter/widgets.dart';
import 'package:portfolio/shared/constants.dart';
import 'package:portfolio/style/context_extensions.dart';
import 'package:portfolio/widgets/text/display_large_text.dart';
import 'package:portfolio/widgets/text/display_small_text.dart';

class BrandName extends StatelessWidget {
  const BrandName({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isSmall
        ? const DisplaySmallText(Constants.name)
        : const DisplayLargeText(Constants.name);
  }
}
