import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../base_model.dart';

class WineListModel extends BaseModel{
  final WineService _wineService;
  WineListModel({WineService wineService}) : _wineService = wineService;

  List<Wine> get wines => _wineService.wines;

  Future<void> onRefresh()async{
    print("Im refreshing");
    setBusy(true);
    _wineService.getAllWine();
    setBusy(false);
  }

}