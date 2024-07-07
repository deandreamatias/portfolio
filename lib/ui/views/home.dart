import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../core/utils/constants.dart';
import '../widgets/custom_cards.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/menu.dart';

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
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: MenuWidget(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ResponsiveBuilder(
              builder:
                  (BuildContext context, SizingInformation sizingInformation) {
                switch (sizingInformation.deviceScreenType) {
                  case DeviceScreenType.desktop:
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            HeaderWidget(
                              title:
                                  AppLocalizations.of(context)!.homeHeaderTitle,
                              subtitle: AppLocalizations.of(context)!
                                  .homeHeaderSubtitle,
                              image: Urls.profile,
                              key: const Key(Urls.profile),
                            ),
                            const LanguagesWidget(),
                          ],
                        ),
                        const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GithubWidget(),
                            SkillsWidget(),
                            ContactWidget(),
                          ],
                        )
                      ],
                    );
                  default:
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            HeaderWidget(
                              title:
                                  AppLocalizations.of(context)!.homeHeaderTitle,
                              subtitle: AppLocalizations.of(context)!
                                  .homeHeaderSubtitle,
                              image: Urls.profile,
                              key: const Key(Urls.profile),
                            ),
                            const GithubWidget(),
                            const SkillsWidget(),
                            const LanguagesWidget(),
                            const ContactWidget(),
                          ],
                        ),
                      ),
                    );
                }
              },
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Footer(),
          )
        ],
      ),
    );
  }
}
