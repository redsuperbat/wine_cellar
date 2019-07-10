import 'dart:async';

import 'package:meta/meta.dart';
import 'package:wine_cellar/core/models/wine.dart';

import 'wine_db_service.dart';

class WineService {
  final WineDb _db;
  final StreamController<String> _subType = StreamController.broadcast();
  final StreamController<List<Wine>> _wines = StreamController.broadcast();
  final StreamController<Wine> _wine = StreamController.broadcast();

  WineService({@required WineDb database}) : _db = database;

  Stream<Wine> get wineStream => _wine.stream;

  Sink<Wine> get wineSink => _wine.sink;

  Sink get subTypeSink => _subType.sink;

  Stream get subType => _subType.stream;

  Stream<List<Wine>> get wines => _wines.stream;

  Wine wine = Wine();

  String category;
  String subCategory;

  void closeControllers() {
    _subType.close();
    _wines.close();
    _wine.close();
  }

  void resetWine(){
    wine = Wine();
  }

  Future<void> initializeDb() async {
    await _db.iniDb();
    await getAllWine();
  }

  Future<void> searchWine(String query) async {
    _wines.add(await _db.searchWine(query));
  }

  Future removeWine(Wine wine) async {
    _db.deleteWine(wine.id);
    await getAllWine();
  }

  Future changeCellar(String cellarName) async {
    _db.changeCellar(cellarName);
    await getAllWine();
  }

  Future addCellar(String name) async {
    await _db.createNewTable(name);
    await getAllWine();
  }

  Future<void> filterWine() async {
    _wines.add(await _db.filterWine(query: subCategory, column: category));
  }

  Future<void> insertWine() async {
    wine.id = await _db.getId();
    wine.time = DateTime.now().toString();
    print('wine image path is: ${wine.image}');
    await _db.insertWine(wine);
    await getAllWine();
  }

  Future<void> getAllWine() async {
    _wines.add(await _db.getAllWines());
  }

  Future<void> updateWine({Wine newWine}) async {
    await _db.updateWine(newWine ?? wine);
    await getAllWine();
  }

  Future decrementWine(Wine wine) async {
    if (wine.owned == 0)
      await removeWine(wine);
    else
      await updateWine(newWine: wine);
  }
}
