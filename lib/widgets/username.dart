import 'package:flutter/material.dart';
import 'package:portfolio/shared/constants.dart';
import 'package:portfolio/shared/sizes.dart';
import 'package:portfolio/widgets/text/title_medium_text.dart';

class Username extends StatelessWidget {
  const Username({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: .all(Sizes.medium),
      child: TitleMediumText(Constants.username),
    );
  }
}
