import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/viewmodels/views/wine_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constants.dart';
import 'base_widget.dart';
import 'widgets/wine_view/wine_image.dart';

class WineView extends StatelessWidget {
  final Wine wine;

  const WineView({this.wine});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<WineModel>(
      model: WineModel(wineService: Provider.of(context)),
      onModelReady: (model) => model.initialize(wine),
      builder: (context, model, child) => WillPopScope(
            onWillPop: () => model.updateWine(wine),
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(wine.name),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => Navigator.pushNamed(context, 'edit'),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(25),
                              child: WineImage(
                                path: wine.image,
                                width: MediaQuery.of(context).size.width*0.4,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Rating",
                                  style: titleStyle,
                                ),
                                Text(
                                  "Set the rating by dragging the stars",
                                  style: hintStyle,
                                ),
                                FlutterRatingBar(
                                  initialRating: wine.rating,
                                  allowHalfRating: true,
                                  onRatingUpdate: (rating) =>
                                      model.setRating(rating, wine),
                                ),
                                Text('${wine.rating}/5.0')
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              WineInfo(text: '${wine.country}, ${wine.aoo}'),
                              WineInfo(text: wine.vintage.toString()),
                              WineInfo(text: wine.grapes),
                              WineInfo(text: wine.price.toString()),
                              WineInfo(text: wine.type)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Comments",
                      style: titleStyle,
                    ),
                    Card(
                      margin: EdgeInsets.only(right: 25, left: 25, bottom: 10),
                      elevation: 3,
                      child: TextField(
                        controller: model.cmtController,
                        onChanged: (value) => model.setComments(value, wine),
                        decoration: InputDecoration.collapsed(
                          hintText: "Write your notes about the wine here",
                        ),
                        maxLines: 10,
                      ),
                    ),
                    Text(
                      'Placed in cellar: ${wine.time.substring(0, 16)}',
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}

class WineInfo extends StatelessWidget {
  final String text;

  const WineInfo({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
