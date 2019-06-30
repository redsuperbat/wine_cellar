import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';
import 'package:image_picker/image_picker.dart';

import 'package:wine_cellar/core/viewmodels/base_model.dart';

class AddModel extends BaseModel {
  final WineService _wineService;

  File image;

  Wine get wine => _wineService.wine;

  TextEditingController cmtController;

  TextEditingController vintageController;
  TextEditingController countryController;

  AddModel({
    @required WineService wineService,
  }) : _wineService = wineService {
    cmtController = TextEditingController(text: wine.comment);
    cmtController.addListener(setComments);

    vintageController = TextEditingController(text: wine.vintage.toString());
    countryController = TextEditingController(text: wine.country);

    if (wine.image != null) image = File(wine.image);
  }

  Future<void> getImage() async {
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    notifyListeners();
  }

  @override
  void dispose() {
    print("Disposing AddModel");
    _wineService.wine = Wine();
    super.dispose();
  }

  Future<bool> updateWine() async {
    await _wineService.updateWine();
    return true;
  }

  void setRating(double value) {
    _wineService.wine.rating = value;
    notifyListeners();
  }

  void setComments() {
    _wineService.wine.comment = cmtController.text;
  }

  Future addWineToDb() async {
    _wineService.wine.image = image == null ? null : image.path;
    print(_wineService.wine.vintage);
    await _wineService.insertWine();
  }
}
