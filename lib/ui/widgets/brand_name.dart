import 'package:flutter/widgets.dart';
import 'package:portfolio/data/constants.dart';
import 'package:portfolio/ui/style/context_extensions.dart';
import 'package:portfolio/ui/widgets/text/display_medium_text.dart';
import 'package:portfolio/ui/widgets/text/display_small_text.dart';

class BrandName extends StatelessWidget {
  const BrandName({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isSmall
        ? const DisplaySmallText(Constants.name)
        : const DisplayMediumText(Constants.name);
  }
}
