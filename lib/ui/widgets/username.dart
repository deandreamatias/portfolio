import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/constants.dart';
import 'package:portfolio/ui/shared/sizes.dart';
import 'package:portfolio/ui/widgets/text/body_medium_text.dart';

class Username extends StatelessWidget {
  const Username({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(Sizes.large),
      child: BodyMediumText(Constants.username),
    );
  }
}
