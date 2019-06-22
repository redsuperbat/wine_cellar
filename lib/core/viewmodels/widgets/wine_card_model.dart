import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../base_model.dart';

class WineCardModel extends BaseModel {
  final WineService _wineService;

  WineCardModel({WineService wineService}) : _wineService = wineService;

  void decrement(Wine wine) {
    _wineService.decrementWine(wine);
    notifyListeners();
  }
  void removeWine(Wine wine){
    _wineService.removeWine(wine);
    notifyListeners();
  }
  void injectWine(Wine wine) {
    _wineService.viewWine = wine;
  }

}
