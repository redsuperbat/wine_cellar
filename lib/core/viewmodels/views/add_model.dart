import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';
import 'package:image_picker/image_picker.dart';

import 'package:wine_cellar/core/viewmodels/base_model.dart';

class AddModel extends BaseModel {
  final WineService _wineService;

  AddModel({@required WineService wineService}) : _wineService = wineService;

  File image;

  Wine get wine => _wineService.addWine;

  //Getters

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

  Future updateWine() async{
    await _wineService.updateWine();
  }

  void setRating(double value){
    _wineService.addWine.rating = value;
    notifyListeners();
  }

  void setComments(String value){
    _wineService.addWine.comment = value;
  }


  Future addWineToDb() async {
    _wineService.addWine.image = image == null ? null : image.path;
    print(_wineService.addWine);
    await _wineService.insertWine();
  }
}
