import 'package:meta/meta.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/json_service.dart';
import 'package:wine_cellar/core/services/wine_service.dart';


import 'package:wine_cellar/core/viewmodels/base_model.dart';

class HomeModel extends BaseModel {
  final WineService _wineService; //= locator<WineService>();
  final  JsonService _json; // = locator<JsonService>();

  HomeModel({@required WineService wineService, @required JsonService json}):
      _json = json, _wineService = wineService;

  List<String> filter;

  String subtitle = "show all";

  List<Wine> get wines => _wineService.wines;

  List<String> get sizes => _json.sizes;

  List<String> get types => _json.types;

  Future<void> loadDbData() async {
    setBusy(true);
    await _wineService.initializeDb();
    setBusy(false);
  }

  Future<void> getAllWine()async{
    setBusy(true);
    await _wineService.getAllWine();
    setBusy(false);
  }

  Future<void> loadAssets() async {
    setBusy(true);
    await _json.loadAssets();
    filter = [
      ['show all'],
      sizes,
      types
    ].expand((l) => l).toList();
    setBusy(false);
  }

  Future<void> filterWines(String value) async {
    subtitle = value;
    if (value == 'show all') await _wineService.getAllWine();
    if (sizes.contains(value))
      await _wineService.filterWine(query: value, column: 'size');
    if (types.contains(value))
      await _wineService.filterWine(query: value, column: 'type');
    notifyListeners();
  }
}
