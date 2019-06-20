import 'package:flutter/widgets.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../../locator.dart';
import 'base_model.dart';

class WineModel extends BaseModel {
  final WineService _wineService = locator<WineService>();
  Wine wine;
  TextEditingController _controller;

  String get text => _controller.text;

  TextEditingController get controller => _controller;

  WineModel() {
    wine = _wineService.viewWine;
    _controller = TextEditingController(text: wine.comment);
  }

  Future<bool> updateWine() async {
    wine.comment = _controller.text;
    await _wineService.updateWine(wine);
    return true;
  }


  void updateRating(double rating){
    wine.rating = rating;
  }
}
