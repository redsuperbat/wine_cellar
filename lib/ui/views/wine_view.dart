import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/viewmodels/views/wine_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'base_widget.dart';
import 'widgets/add_view/picker.dart';
import 'package:wine_cellar/ui/views/widgets/wine_view/wine_form.dart';
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
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(25),
                              child: WineImage(
                                path: wine.image,
                                width: 150,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("Rating"),
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
                        Column(
                          children: <Widget>[
                            Text('${wine.country}, ${wine.aoo}'),
                            Text("")
                          ],
                        ),
                      ],
                    ),
                    Text("Comments"),
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
                      'Put in cellar: ${wine.time.substring(0, 16)}',
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
