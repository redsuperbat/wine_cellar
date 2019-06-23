import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../base_model.dart';
import 'package:flutter/material.dart';

class WineFormModel extends BaseModel {
  final WineService _wineService;

  WineFormModel({WineService wineService}) : _wineService = wineService {
    aooController = TextEditingController(text: wine.aoo ?? "");
    nameController = TextEditingController(text: wine.name?? "");
    grapeController = TextEditingController(text: wine.grapes ?? "");
    priceController = TextEditingController(
        text: wine.price == 0.0 ? 'Set price' : wine.price.toString());
    aooController.addListener(setAoo);
    nameController.addListener(setName);
    grapeController.addListener(setGrapes);
    priceController.addListener(setPrice);

  }

/*  final TextEditingController aooCont = TextEditingController();
  final TextEditingController priceCont = TextEditingController();
  final TextEditingController grapeCont = TextEditingController();
  final TextEditingController nameProdCont = TextEditingController();*/

  TextEditingController aooController;
  TextEditingController priceController;
  TextEditingController nameController;
  TextEditingController grapeController;



  Wine get wine => _wineService.addWine;

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
}
