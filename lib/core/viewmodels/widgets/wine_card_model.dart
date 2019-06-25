import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../base_model.dart';

class WineCardModel extends BaseModel {
  final WineService _wineService;

  WineCardModel({WineService wineService}) : _wineService = wineService;

  void removeWine(Wine wine) {
    _wineService.removeWine(wine);
  }


  void injectWine(Wine wine) {
    _wineService.wine = wine;
  }

  Future decrement(Wine wine)async {
   await _wineService.decrementWine(wine);
  }
}
