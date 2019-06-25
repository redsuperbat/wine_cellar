import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/views/add_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'base_widget.dart';
import 'widgets/add_view/picker.dart';
import 'package:wine_cellar/ui/views/shared/wine_form.dart';
import 'widgets/wine_view/wine_image.dart';

class WineView extends StatelessWidget {
  final double fontSize = 25;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AddModel>(
      model: AddModel(wineService: Provider.of(context)),
      builder: (context, model, child) => WillPopScope(
            onWillPop: () => model.updateWine(),
            child: Scaffold(
              appBar: AppBar(
                title: Text("Your Wine"),
              ),
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
                    Flexible(
                      child: WineForm(
                        add: false,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[Flexible(child: Picker())],
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
