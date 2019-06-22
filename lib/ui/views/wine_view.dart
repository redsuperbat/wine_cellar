import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/wine_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'base_view.dart';
import 'widgets/add_view/picker.dart';
import 'widgets/wine_view/property_changer.dart';
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
                            Text('${model.wine.rating}/5.0')
                          ],
                        ),
                      ],
                    ),
                    WineInfo(
                      model: model,
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: PropertyChanger(
                            keyBoardType: TextInputType.number,
                            controller: model.priceController,
                            title: 'Purchase price',
                          ),
                        ),
                        Spacer(),
                        Text(
                          '${model.wine.owned} pc',
                          style: TextStyle(fontSize: fontSize),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Picker(
                          hint: Text('Type of Wine'),
                          setter: (value) => model.setType(value),
                          value: model.wine.type == "" ? null : model.wine.type,
                          items: model.types,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Picker(
                          hint: Text('Size of bottle(s)'),
                          setter: (value) => model.setSize(value),
                          value: model.wine.size == "" ? null : model.wine.size,
                          items: model.sizes,
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
