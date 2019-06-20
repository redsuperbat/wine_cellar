import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/json_service.dart';
import 'package:wine_cellar/core/services/wine_service.dart';
import 'package:wine_cellar/core/enums/viewstate.dart';

import '../../locator.dart';

import 'base_model.dart';

class HomeModel extends BaseModel {
  WineService _wineService = locator<WineService>();
  JsonService _json = locator<JsonService>();
  List<String> filter;

  List<Wine> get wines => _wineService.wines;

  List<String> get sizes => _json.sizes;

  List<String> get types => _json.types;

  final List<Map<String, dynamic>> typess = [
    {'title': 'Red', 'type': false},
    {'title': 'white', 'type': false},
    {'title': 'Rosé', 'type': false}
  ];

  Future<void> loadMockData() async {
    setState(ViewState.Busy);
    await _wineService.loadMockData();
    _wineService.wines
        .sort((first, second) => first.time.compareTo(second.time));
    setState(ViewState.Idle);
  }

  void injectWine(Wine wine) {
    _wineService.viewWine = wine;
  }

  void removeWine(Wine wine) {
    _wineService.removeWine(wine);
    notifyListeners();
  }

  void decrementWine(Wine wine) {
    _wineService.decrementWine(wine);
    notifyListeners();
  }

  Future<void> loadAssets() async {
    setState(ViewState.Busy);
    await _json.loadAssets();
    filter = [
      ['show all'],
      sizes,
      types
    ].expand((l) => l).toList();
    setState(ViewState.Idle);
  }

  Future<void> filterWines(String value) async {
    if (value == 'show all') await _wineService.getAllWine();
    if (sizes.contains(value))
      await _wineService.filterWine(query: value, column: 'size');
    if (types.contains(value))
      await _wineService.filterWine(query: value, column: 'type');
    notifyListeners();
  }

  void filterType(String title, bool type) {
    type = !type;
    if (type)
      _wineService.filterWine(query: title, column: 'type');
    else
      _wineService.getAllWine();
    notifyListeners();
  }
}
