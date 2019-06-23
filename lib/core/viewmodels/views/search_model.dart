import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import 'package:wine_cellar/core/viewmodels/base_model.dart';

class SearchModel extends BaseModel {
  final WineService _wineService;

  List<Wine> get wines => _wineService.wines;

  SearchModel({WineService wineService}) : _wineService = wineService;

  Future<bool> getAllWine() async {
    await _wineService.getAllWine();
    return true;
  }

  @override
  void dispose() {
    print("Search Model disposing");
    super.dispose();
  }

  void search(String query) async {
    setBusy(true);
    await _wineService.searchWine(query);
    setBusy(false);
  }
}
