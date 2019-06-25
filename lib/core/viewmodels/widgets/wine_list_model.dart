import 'package:meta/meta.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/json_service.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../base_model.dart';

class WineListModel extends BaseModel {
  final WineService _wineService;
  final JsonService _json;

  WineListModel({WineService wineService, @required JsonService json})
      : _wineService = wineService,
        _json = json;

  Stream<List<Wine>> get wines => _wineService.wines;


  Future<void> onRefresh() async {
    _wineService.subTypeSink.add("show all");
    await _wineService.getAllWine();
  }

  Future<void> loadAssets() async {
    setBusy(true);
    await _json.loadAssets();
    setBusy(false);
  }
}
