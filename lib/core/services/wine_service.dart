import 'package:meta/meta.dart';
import 'package:wine_cellar/core/models/wine.dart';

import 'wine_db_service.dart';

class WineService {
  final WineDb _db;

  WineService({@required WineDb database}) : _db = database;

  Wine addWine = Wine();

  Wine viewWine;

  String subType = "show all";

  String type = "";

  List<Wine> _wines = [];

  List<Wine> get wines => _wines;

  Future<void> initializeDb() async {
    await _db.iniDb();
    _wines = await _db.getWines();
  }

  Future<void> searchWine(String query) async {
    _wines = await _db.searchWine(query);
    sort('time');
  }

  void removeWine(Wine wine) {
    _db.deleteWine(wine.id);
  }

  Future<void> filterWine({String query, String column}) async {
    _wines = await _db.filterWine(query: query, column: column);
  }

  Future<void> insertWine() async {
    addWine.id = wines.length + 1;
    addWine.time = DateTime.now().toString();
    wines.insert(0, addWine);
    await _db.insertWine(addWine);
  }

  Future<void> getAllWine() async {
    _wines = await _db.getWines();
    sort('time');
  }

  Future<void> updateWine() async {
    await _db.updateWine(addWine);
  }

  void decrementWine(Wine wine) {
    if (wine.owned == 1) removeWine(wine);
    wine.owned--;
    _db.updateWine(wine);
  }

  void sort(String sort) {
    switch (sort) {
      case 'time':
        return wines.sort((f, s) => s.time.compareTo(f.time));
      case 'type':
        return wines.sort((f, s) => f.type.compareTo(s.type));
      case 'size':
        return wines.sort((f, s) => f.size.compareTo(s.size));
      case 'price':
        return wines.sort((f, s) => f.price.compareTo(s.price));
    }
  }
}
