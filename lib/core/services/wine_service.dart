import 'package:wine_cellar/core/models/wine.dart';

import '../../locator.dart';
import 'wine_db_service.dart';

class WineService {
  WineDb _db = locator<WineDb>();

  Wine viewWine;

  List<Wine> _wines = [];

  List<Wine> get wines => _wines;

  void removeWine(Wine wine) {
    _wines.removeWhere((w) => w.id == wine.id);
    _db.deleteWine(wine.id);
  }

  Future<void> loadMockData() async {
    await _db.iniDb();
    _wines = await _db.getWines();
  }

  void decrementWine(Wine wine) {
    if (wine.owned == 1) removeWine(wine);
    wine.owned--;
    _db.updateWine(wine);
  }

  Future<void> filterWine({String query, String column}) async {
    _wines = await _db.filterWine(query: query, column: column);
  }

  Future<void> insert(Wine wine) async {
    _wines.insert(0, wine);
    await _db.insertWine(wine);
  }

  Future<void> getAllWine()async{
    _wines = await _db.getWines();
  }

  Future<void> updateWine(Wine wine) async {
    await _db.updateWine(wine);
  }
}
