import 'package:meta/meta.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/json_service.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import 'package:wine_cellar/core/viewmodels/base_model.dart';

class HomeModel extends BaseModel {
  final WineService _wineService;

  HomeModel({@required WineService wineService}) : _wineService = wineService;

  Stream<List<Wine>> get wines => _wineService.wines;

  Stream<String> get subType => _wineService.subType;

  bool search =false;

  void beginSearch(){
    search = !search;
    notifyListeners();
  }

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
}
