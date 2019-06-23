import 'package:wine_cellar/core/services/wine_service.dart';

import '../base_model.dart';

class VintagePickerModel extends BaseModel {
  final WineService _wineService;

  DateTime selected = DateTime.now();
  bool isChecked = false;

  VintagePickerModel({WineService wineService}) : _wineService = wineService;

  void change() {
    isChecked = !isChecked;
    notifyListeners();
  }

  void setYear(DateTime value) {
    print('this is the dateTiem $value');
    selected = value;
    _wineService.addWine.vintage = isChecked ? "NV" : selected.year.toString();
    notifyListeners();
  }
}
