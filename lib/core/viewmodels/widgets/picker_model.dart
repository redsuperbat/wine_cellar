import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/json_service.dart';
import 'package:wine_cellar/core/services/wine_service.dart';
import 'dart:async';

import '../base_model.dart';

class PickerModel extends BaseModel {
  final JsonService _json;
  final WineService _wineService;

  StreamSubscription subscription;

  PickerModel(this._json, this._wineService) {
    subscription = wineStream.listen((wine) => setWine(wine));
  }

  Stream<Wine> get wineStream => _wineService.wineStream;

  Wine get wine => _wineService.wine;

  List<String> get sizes => _json.sizes;

  List<String> get types => _json.types;


  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void setWine(Wine _wine) {
    _wineService.wine = _wine;
    notifyListeners();
  }

  void setType(String value) {
    wine.type = value;
    notifyListeners();
  }

  void setSize(String value) {
    wine.size = value;
    notifyListeners();
  }
}
