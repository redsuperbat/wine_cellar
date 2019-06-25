import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../base_model.dart';
import 'package:flutter/material.dart';

class WineFormModel extends BaseModel {
  final WineService _wineService;

  TextEditingController aooController;
  TextEditingController priceController;
  TextEditingController nameController;
  TextEditingController grapeController;
  TextEditingController vintageController;
  TextEditingController countryController;

  WineFormModel({WineService wineService}) : _wineService = wineService {
    aooController = TextEditingController(text: wine.aoo ?? "");
    nameController = TextEditingController(text: wine.name ?? "");
    grapeController = TextEditingController(text: wine.grapes ?? "");
    priceController = TextEditingController(
        text: wine.price == 0.0 ? 'Set price' : wine.price.toString());
    vintageController = TextEditingController(text: wine.vintage);
    countryController = TextEditingController(text: wine.country ?? "");

    countryController.addListener(setCountry);
    vintageController.addListener(setVintage);
    aooController.addListener(setAoo);
    nameController.addListener(setName);
    grapeController.addListener(setGrapes);
    priceController.addListener(setPrice);
  }

  Wine get wine => _wineService.wine;

  void setName() {
    wine.name = nameController.text;
  }

  void setAoo() {
    wine.aoo = aooController.text;
  }

  void setPrice() {
    wine.price = double.tryParse(priceController.text);
  }

  void setGrapes() {
    wine.grapes = grapeController.text;
  }

  void setVintage() {
    wine.vintage = vintageController.text;
  }

  void setCountry() {
    wine.country = countryController.text;
  }
}
