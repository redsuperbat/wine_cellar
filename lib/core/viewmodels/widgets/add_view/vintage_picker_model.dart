import 'dart:async';

import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../../base_model.dart';

class VintagePickerModel extends BaseModel {
  final WineService _wineService;

  int selected = DateTime.now().year;
  bool isChecked = false;
  StreamSubscription subscription;

  Stream<Wine> get wineStream => _wineService.wineStream;

  Wine get wine => _wineService.wine;

  VintagePickerModel({WineService wineService}) : _wineService = wineService {
    subscription = wineStream.listen((wine) => setVintageFromStream(wine));
  }

  @override
  void dispose() {
    print("Im disposing of VintagePicker");
    subscription.cancel();
    super.dispose();
  }

  void setVintageFromStream(Wine _wine) {
    if (_wine.vintage == null) {
      wine.nv = true;
      isChecked = true;
      notifyListeners();
    }
    else{
      setYear(_wine.vintage);
    }
  }

  void change() {
    wine.nv = !wine.nv;
    isChecked = !isChecked;
    notifyListeners();
  }

  void setYear(int year) {
    print('this is the datetime: $year');
    selected = year;
    wine.vintage = isChecked ? null : year;
    notifyListeners();
  }
}
