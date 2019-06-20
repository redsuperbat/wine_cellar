import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/wine_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constants.dart';

import 'base_view.dart';
import 'widgets/wine_view/wine_image.dart';
import 'widgets/wine_view/wine_info.dart';

class WineView extends StatelessWidget {
  final double fontSize = 25;

  @override
  Widget build(BuildContext context) {
    return BaseView<WineModel>(
      builder: (context, model, child) => WillPopScope(
            onWillPop: () => model.updateWine(),
            child: Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    WineInfo(
                      model: model,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        WineImage(
                          model: model,
                        ),
                        Column(
                          children: <Widget>[
                            Text("Rating"),
                            FlutterRatingBar(
                              initialRating: model.wine.rating,
                              allowHalfRating: true,
                              onRatingUpdate: (rating) =>
                                  model.updateRating(rating),
                            ),
                            Text('${model.wine.rating}')
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
                        decoration: InputDecoration.collapsed(
                          hintText: "Write your notes about the wine here",
                        ),
                        maxLines: 10,
                      ),
                    ),
                    Text(
                      'Put in cellar: ${model.wine.time.substring(0, 16)}',
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
