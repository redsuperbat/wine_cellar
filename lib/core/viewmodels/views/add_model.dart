import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';
import 'package:image_picker/image_picker.dart';

import 'package:wine_cellar/core/viewmodels/base_model.dart';

class AddModel extends BaseModel {
  final WineService _wineService;

  File image;

  Wine get wine => _wineService.addWine;

  TextEditingController cmtController;

  TextEditingController vintageController;
  TextEditingController countryController;

  AddModel({
    @required WineService wineService,
  }) : _wineService = wineService {
    cmtController = TextEditingController(text: wine.comment);
    cmtController.addListener(setComments);

    vintageController = TextEditingController(text: wine.vintage);
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
    _wineService.addWine = Wine();
    super.dispose();
  }

  Future<bool> updateWine() async {
    await _wineService.updateWine();
    return true;
  }

  void setRating(double value) {
    _wineService.addWine.rating = value;
    notifyListeners();
  }

  void setComments() {
    _wineService.addWine.comment = cmtController.text;
  }

  Future addWineToDb() async {
    _wineService.addWine.image = image == null ? null : image.path;
    print(_wineService.addWine.vintage);
    await _wineService.insertWine();
  }
}
