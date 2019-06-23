import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/views/add_model.dart';
import 'package:wine_cellar/core/viewmodels/views/wine_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'base_widget.dart';
import 'widgets/add_view/picker.dart';
import 'widgets/add_view/wine_form.dart';
import 'widgets/wine_view/wine_image.dart';
import 'widgets/wine_view/wine_info.dart';

class WineView extends StatelessWidget {
  final double fontSize = 25;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AddModel>(
      model: AddModel(
        wineService: Provider.of(context)
      ),
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
                                  model.setRating(rating),
                            ),
                            Text('${model.wine.rating}/5.0')
                          ],
                        ),
                      ],
                    ),
                    WineForm(),
                   /* Row(
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 8),
                                child: Text('Purchase price'),
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: InputBorder.none),
                                        controller: model.priceController,
                                      ),
                                    ),
                                    Text(
                                      "Current currency",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Text(
                          '${model.wine.owned} pc',
                          style: TextStyle(fontSize: fontSize),
                        ),
                        Spacer(),
                      ],
                    ),*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Picker()
                      ],
                    ),
                    Text("Comments"),
                    Card(
                      margin: EdgeInsets.only(right: 25, left: 25, bottom: 10),
                      elevation: 3,
                      child: TextField(
                        onChanged: (value) => model.setComments(value),
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
