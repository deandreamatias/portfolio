import 'package:flutter/material.dart';
import 'package:portfolio/shared/sizes.dart';
import 'package:portfolio/widgets/content.dart';
import 'package:portfolio/widgets/expats_wiki_button.dart';
import 'package:portfolio/widgets/github_button.dart';
import 'package:portfolio/widgets/header.dart';
import 'package:portfolio/widgets/linkedin_button.dart';

import '../widgets/username.dart';

class HomeView extends StatefulWidget {
  static const String route = '/';
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: const IntrinsicHeight(
                    child: Column(
                      children: [
                        Header(),
                        Flexible(child: Content()),
                      ],
                    ),
                  ),
                ),
              ),
              const Align(alignment: Alignment.bottomCenter, child: Footer()),
            ],
          );
        },
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: Sizes.large),
      child: const Wrap(
        alignment: WrapAlignment.center,
        spacing: Sizes.medium,
        runSpacing: Sizes.medium,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Username(),
          ExpatsWikiButton(),
          LinkedinButton(),
          GithubButton(),
        ],
      ),
    );
  }
}
