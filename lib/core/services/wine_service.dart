import 'dart:async';

import 'package:meta/meta.dart';
import 'package:wine_cellar/core/models/wine.dart';

import 'wine_db_service.dart';

class WineService {
  final WineDb _db;
  final StreamController<String> _subType = StreamController.broadcast();
  final StreamController<String> _type = StreamController.broadcast();
  final StreamController<List<Wine>> _wines = StreamController.broadcast();

  Wine wine = Wine();

  WineService({@required WineDb database}) : _db = database;

  Sink get typeSink => _type.sink;

  Sink get subTypeSink => _subType.sink;

  Stream get subType => _subType.stream;

  Stream get type => _type.stream;

  Stream get wines => _wines.stream;

  String category;
  String subCategory;

  void closeControllers() {
    _subType.close();
    _type.close();
    _wines.close();
  }

  Future<void> initializeDb() async {
    await _db.iniDb();
    await getAllWine();
  }

  Future<void> searchWine(String query) async {
    _wines.add(await _db.searchWine(query));
    // sort('time');
  }

  Future removeWine(Wine wine) async {
    _db.deleteWine(wine.id);
    await getAllWine();
  }

  Future<void> filterWine() async {
    _wines.add(await _db.filterWine(query: subCategory, column: category));
  }

  Future<void> insertWine() async {
    await _db.getAllWines().then((onValue) => wine.id = onValue.length);
    wine.time = DateTime.now().toString();
    await _db.insertWine(wine);
    await getAllWine();
  }

  Future<void> getAllWine() async {
    _wines.add(await _db.getAllWines());
    // sort('time');
  }

  Future<void> updateWine({Wine newWine}) async {
    await _db.updateWine(newWine ?? wine);
    await getAllWine();
  }

  Future decrementWine(Wine wine) async {
    wine.owned--;
    if (wine.owned == 0)
      await removeWine(wine);
    else
      await updateWine(newWine: wine);
  }

/*  void sort(String sort) {
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
  }*/
}
