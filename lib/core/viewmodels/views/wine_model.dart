
import 'package:flutter/material.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import 'package:wine_cellar/core/viewmodels/base_model.dart';

class WineModel extends BaseModel {
  final WineService _wineService;

  final TextEditingController cmtController = TextEditingController();
  WineModel({@required WineService wineService}) : _wineService = wineService;



  void initialize(Wine wine) {
    cmtController.text = wine.comment;
  }

  @override
  void dispose() {
    print("Disposing AddModel");
    super.dispose();
  }

  Future<bool> updateWine(Wine wine) async {
    await _wineService.updateWine(newWine: wine);
    return true;
  }

  void setRating(double value, Wine wine) {
    wine.rating = value;
    notifyListeners();
  }

  void setComments(String value, Wine wine) {
    wine.comment = value;
  }

}
