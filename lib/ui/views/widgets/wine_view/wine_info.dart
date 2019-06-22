
import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/wine_model.dart';

import 'property_changer.dart';

class WineInfo extends StatelessWidget {
  final WineModel model;
  final double fontSize = 25;

  const WineInfo({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PropertyChanger(
          controller: model.nameController,
          title: 'Brand name and Wineproducer',
        ),
        PropertyChanger(
          controller: model.countryController,
          title: 'Country',
        ),
        PropertyChanger(
          controller: model.aooController,
          title: 'Appellation of origin',
        ),
        PropertyChanger(
          controller: model.vintageController,
          title: 'Vintage',
        ),
      ],
    );
  }
}
