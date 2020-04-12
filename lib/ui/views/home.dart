import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../core/utils/constants.dart';
import '../widgets/custom_cards.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/menu.dart';

class HomeView extends StatefulWidget {
  static const String route = '/';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
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
                  case DeviceScreenType.Desktop:
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            HeaderWidget(
                              title: translate('home.header.title'),
                              subtitle: translate('home.header.subtitle'),
                              image: Urls.PROFILE,
                            ),
                            LanguagesWidget(),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GithubWidget(),
                            SkillsWidget(),
                            ContactWidget(),
                          ],
                        )
                      ],
                    );
                    break;
                  default:
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            HeaderWidget(
                              title: translate('home.header.title'),
                              subtitle: translate('home.header.subtitle'),
                              image: Urls.PROFILE,
                            ),
                            GithubWidget(),
                            SkillsWidget(),
                            LanguagesWidget(),
                            ContactWidget(),
                          ],
                        ),
                      ),
                    );
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Footer(),
          )
        ],
      ),
    );
  }
}
