import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../core/data/streamigs.dart';
import '../../core/utils/navigate_links.dart';
import 'circular_image.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
    this.title,
    this.subtitle,
    this.image,
    this.streaming = false,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final String image;
  final bool streaming;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(width: 8.0,),
                  CircularImage(image: image),
                ],
              ),
              const SizedBox(height: 16.0),
              Flexible(
                fit: FlexFit.loose,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 4,
                      child: Text(
                        subtitle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Visibility(
                      visible: streaming,
                      child: Flexible(
                        flex: 1,
                        child: IconButton(
                          tooltip: translate('podcast.streaming.button_streaming'),
                          icon: Icon(Icons.audiotrack),
                          onPressed: () => showModalBottomSheet<Container>(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.vertical(
                                  top: Radius.circular(30.0)),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 320,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.all(16.0),
                                  itemCount: streamings.length,
                                  itemBuilder: (BuildContext context, int index) => 
                                    ListTile(
                                      title: Text(streamings[index].title),
                                      onTap: () => openApp(streamings[index].url),
                                      leading: Icon(Icons.audiotrack),
                                    ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
