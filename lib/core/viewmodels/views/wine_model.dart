import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/json_service.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import 'package:wine_cellar/core/viewmodels/base_model.dart';

class WineModel extends BaseModel {
  final WineService _wineService;
  final JsonService _json;

  TextEditingController cmtController;
  TextEditingController nameController;
  TextEditingController vintageController;
  TextEditingController countryController;
  TextEditingController aooController;
  TextEditingController priceController;
  File _image;

  File get image => _image;

  List<String> get sizes => _json.sizes;

  List<String> get types => _json.types;

  Wine wine;

  WineModel(
      {@required WineService wineService,
      @required JsonService json})
      : _json = json,
        _wineService = wineService {
    wine = _wineService.viewWine;
    cmtController = TextEditingController(text: wine.comment);
    nameController = TextEditingController(text: wine.name);
    vintageController = TextEditingController(text: wine.vintage);
    countryController = TextEditingController(text: wine.country);
    aooController = TextEditingController(text: wine.aoo);
    priceController = TextEditingController(
        text: wine.price == 0.0 ? 'Set price' : wine.price.toString());
    if (wine.image != null) _image = File(wine.image);
  }

  Future<bool> updateWine() async {
    wine.comment = cmtController.text;
    wine.country = countryController.text;
    wine.name = nameController.text;
    wine.vintage = vintageController.text;
    wine.aoo = aooController.text;
    wine.price = double.parse(num.tryParse(priceController.text) == null
        ? '0'
        : priceController.text);
    wine.location = '${countryController.text}, ${aooController.text}';
    //await _wineService.updateWine(wine);
    return true;
  }

  void setSize(String value) {
    wine.size = value;
    notifyListeners();
  }

  void setType(String value) {
    wine.type = value;
    notifyListeners();
  }

  void updateRating(double rating) {
    wine.rating = rating;
    notifyListeners();
  }
}
