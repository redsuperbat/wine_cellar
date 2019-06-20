import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/wine_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'base_view.dart';
import 'widgets/wine_view/wine_info.dart';

class WineView extends StatelessWidget {
  final double fontSize = 25;

  @override
  Widget build(BuildContext context) {
    File image;
    return BaseView<WineModel>(
      onModelReady: (model) {
        image = model.wine.image == null ? null : File(model.wine.image);
      },
      builder: (context, model, child) => WillPopScope(
            onWillPop: () => model.updateWine(),
            child: Scaffold(
              appBar: AppBar(),
              body: Column(
                children: <Widget>[
                  WineInfo(
                    model: model,
                    image: image,
                  ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: Card(
                      elevation: 3,
                      child: TextField(
                        controller: model.controller,
                        decoration: InputDecoration.collapsed(
                          hintText: "Write your notes about the wine here",
                        ),
                        maxLines: 10,
                      ),
                    ),
                  ),
                  FlutterRatingBar(
                    initialRating: model.wine.rating,
                    allowHalfRating: true,
                    onRatingUpdate: (rating) =>
                        model.updateRating(rating),
                  )
                ],
              ),
            ),
          ),
    );
  }
}
