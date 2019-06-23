import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../base_model.dart';

class WineListModel extends BaseModel {
  final WineService _wineService;

  WineListModel({WineService wineService}) : _wineService = wineService;

  List<Wine> get wines => _wineService.wines;

  Wine get wine => _wineService.wine;


  Future<void> onRefresh() async {
    print("Im refreshing");
    setBusy(true);
    await _wineService.getAllWine();
    setBusy(false);
  }

  void removeWine(Wine wine) {
    wines.removeWhere((w) => w.id == wine.id);
    _wineService.removeWine(wine);
    notifyListeners();
  }


  void injectWine(Wine newWine) {
    _wineService.wine = newWine;
  }

  void decrement(Wine wine) {
    _wineService.decrementWine(wine);
    notifyListeners();
  }


}
