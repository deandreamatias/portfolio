import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:portfolio/core/utils/constants.dart';
import '../widgets/card.dart';
import '../widgets/data.dart';
import '../widgets/header.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        switch (sizingInformation.deviceScreenType) {
          case DeviceScreenType.Desktop:
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CardWidget(
                      child: HeaderWidget(
                        title: 'Hi, I\'m Matias de Andrea',
                        subtitle:
                            'And also a creative and dynamic developer.\nI really like work with mobile applications, developing UI/UX and software.',
                        image: 'https://twitter.com/deandreamatias/photo',
                      ),
                    ),
                    CardWidget(
                      child: LanguagesWidget(),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CardWidget(
                      child: GithubWidget(),
                    ),
                    CardWidget(
                      child: SkillsWidget(),
                    ),
                    CardWidget(
                      child: ContactWidget(),
                    ),
                  ],
                )
              ],
            );
            break;
          case DeviceScreenType.Tablet:
          case DeviceScreenType.Mobile:
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CardWidget(
                      child: HeaderWidget(
                        title: 'Hi, I\'m Matias de Andrea',
                        subtitle:
                            'And also a creative and dynamic developer.\nI really like work with mobile applications, developing UI/UX and software.',
                        image: Assets.PROFILE,
                      ),
                    ),
                    CardWidget(
                      child: GithubWidget(),
                    ),
                    CardWidget(
                      child: SkillsWidget(),
                    ),
                    CardWidget(
                      child: LanguagesWidget(),
                    ),
                    CardWidget(
                      child: ContactWidget(),
                    ),
                  ],
                ),
              ),
            );
            break;
          default:
            // TODO: Remove
            return Container(color: Colors.purple);
        }
      },
    );
  }
}
