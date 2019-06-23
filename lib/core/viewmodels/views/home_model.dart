import 'package:meta/meta.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/json_service.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import 'package:wine_cellar/core/viewmodels/base_model.dart';

class HomeModel extends BaseModel {
  final WineService _wineService; //= locator<WineService>();
  final JsonService _json; // = locator<JsonService>();

  HomeModel({@required WineService wineService, @required JsonService json})
      : _json = json,
        _wineService = wineService;

  final List<String> filter = ['see all', 'type', 'size'];

  int index = 0;

  String get type => _wineService.type;

  String get subType => _wineService.subType;

  List<Wine> get wines => _wineService.wines;

  List<String> get category => ['see all', "types", "sizes"];

  List<List<String>> get subCategory => [['see all'], sizes, types];

  List<String> get sizes => _json.sizes;

  List<String> get types => _json.types;

  Future<void> loadDbData() async {
    setBusy(true);
    await _wineService.initializeDb();
    setBusy(false);
  }

  Future<void> getAllWine() async {
    setBusy(true);
    await _wineService.getAllWine();
    setBusy(false);
  }

  Future<void> loadAssets() async {
    setBusy(true);
    await _json.loadAssets();
    setBusy(false);
  }

  void setType(String type) {
    _wineService.type = type;
  }

  void setSubType(String subType) {
    _wineService.subType = subType;
  }

  Future<void> filterWines(String value) async {
    notifyListeners();
  }
}
