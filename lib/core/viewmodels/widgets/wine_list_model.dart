import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../base_model.dart';

class WineListModel extends BaseModel {
  final WineService _wineService;

  WineListModel({WineService wineService}) : _wineService = wineService;

  List<Wine> get wines => _wineService.wines;


  Future<void> onRefresh() async {
    print("Im refreshing");
    setBusy(true);
    await _wineService.getAllWine();
    setBusy(false);
  }

  void decrement(Wine wine) {
    _wineService.decrementWine(wine);
    notifyListeners();
  }
  void removeWine(Wine wine){
    _wineService.wines.removeWhere((w)=> w.id == wine.id);
    _wineService.removeWine(wine);
    notifyListeners();
  }
  void injectWine(Wine wine) {
    _wineService.addWine = wine;
  }

}
