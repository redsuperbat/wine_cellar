import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../../locator.dart';
import 'base_model.dart';

class WineModel extends BaseModel {
  final WineService _wineService = locator<WineService>();

  Wine wine;
  TextEditingController cmtController;
  TextEditingController nameController;
  TextEditingController vintageController;
  TextEditingController countryController;
  TextEditingController aooController;
  File _image;

  File get image => _image;

  WineModel() {
    wine = _wineService.viewWine;
    cmtController = TextEditingController(text: wine.comment);
    nameController = TextEditingController(text: wine.name);
    vintageController = TextEditingController(text: wine.vintage);
    countryController = TextEditingController(text: wine.country);
    aooController = TextEditingController(text: wine.aoo);
    if (wine.image != null) _image = File(wine.image);
  }

  Future<bool> updateWine() async {
    wine.comment = cmtController.text;
    wine.country = countryController.text;
    wine.name = nameController.text;
    wine.vintage = vintageController.text;
    wine.location = '${countryController.text}, ${aooController.text}';
    await _wineService.updateWine(wine);
    return true;
  }

  void updateRating(double rating) {
    wine.rating = rating;
    notifyListeners();
  }
}
