import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/json_service.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../base_model.dart';

class PickerModel extends BaseModel {
  final JsonService _json;
  final WineService _wineService;

  PickerModel(this._json, this._wineService);

  Wine get wine => _wineService.addWine;

  List<String> get sizes => _json.sizes;

  List<String> get types => _json.types;

  void setType(String value) {
    _wineService.addWine.type = value;
    notifyListeners();
  }

  void setSize(String value) {
    _wineService.addWine.size = value;
    notifyListeners();
  }


}
