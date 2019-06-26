import 'dart:async';

import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../../base_model.dart';

class VintagePickerModel extends BaseModel {
  final WineService _wineService;

  DateTime selected = DateTime.now();
  bool isChecked = false;
  StreamSubscription subscription;

  Stream<Wine> get wineStream => _wineService.wineStream;

  VintagePickerModel({WineService wineService}) : _wineService = wineService {
    subscription = wineStream.listen((wine) => setVintageFromStream(wine));
  }

  @override
  void dispose() {
    print("Im disposing of VintagePicker");
    subscription.cancel();
    super.dispose();
  }

  void setVintageFromStream(Wine wine) {
    selected = DateTime.tryParse(wine.vintage);
    if (selected == null) {
      _wineService.wine.vintage = "NV";
      isChecked = true;
    }
    notifyListeners();
  }

  void change() {
    isChecked = !isChecked;
    notifyListeners();
  }

  void setYear(DateTime value) {
    print('this is the datetime: $value');
    selected = value;
    _wineService.wine.vintage = isChecked ? "NV" : selected.toString();
    notifyListeners();
  }
}
