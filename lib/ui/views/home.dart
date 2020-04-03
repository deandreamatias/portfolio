import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/card.dart';
import 'package:portfolio/ui/widgets/data.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
            return Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CardWidget(
                        child: ProfileWidget(),
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
              ),
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
                      child: ProfileWidget(),
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
            return Container(color: Colors.purple);
        }
      },
    );
  }
}
