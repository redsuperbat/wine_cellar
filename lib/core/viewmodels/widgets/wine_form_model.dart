import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../base_model.dart';
import 'package:flutter/material.dart';

class WineFormModel extends BaseModel {
  final WineService _wineService;

  WineFormModel({WineService wineService}) : _wineService = wineService;

/*  final TextEditingController aooCont = TextEditingController();
  final TextEditingController priceCont = TextEditingController();
  final TextEditingController grapeCont = TextEditingController();
  final TextEditingController nameProdCont = TextEditingController();*/

  Wine get wine => _wineService.addWine;

  void setName(String value) {
    wine.name = value;
  }

  void setAoo(String value) {
    wine.aoo = value;
  }

  void setPrice(String value) {
    wine.price = double.tryParse(value);
  }

  void setGrapes(String value) {
    wine.grapes = value;
  }
}
