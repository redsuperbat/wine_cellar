import 'package:wine_cellar/core/services/settings_service.dart';
import 'package:wine_cellar/core/services/wine_db_service.dart';
import 'dart:async';
import 'package:wine_cellar/ui/constants.dart';

import '../base_model.dart';

class StatisticsModel extends BaseModel {
  final WineDb _db;
  final Settings _settings;

  StatisticsModel({WineDb db, Settings settings})
      : _db = db,
        _settings = settings;

  String get currency => _settings.currency;

  Map<String, double> typeStats = {};

  Map<String, double> countryStats = {};

  Map<String, int> wines = {};
  int totalWines = 0;
  double cellarWorth = 0;

  Future loadAllStatistics() async {
    setBusy(true);
    totalWines = await _db.getStatistics();
    for (String item in wineCategories) {
      int data = await _db.getStatistics(column: "type", shouldEqual: item);
      if (data != 0) wines[item] = data;
    }
    typeStats = wines.map((s, i) => MapEntry(s, (i / totalWines) * 100));
    wines = {};
    for (String item in countryNames) {
      int data = await _db.getStatistics(column: "country", shouldEqual: item);
      if (data != 0) wines[item] = data;
    }
    countryStats = wines.map((s, i) => MapEntry(s, (i / totalWines) * 100));
    cellarWorth = await _db.getCellarWorth();
    setBusy(false);
  }
}
