import 'package:meta/meta.dart';
import 'package:wine_cellar/core/models/country.dart';
import 'package:wine_cellar/core/services/json_service.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../base_model.dart';

class CountryPickerModel extends BaseModel {
  final JsonService _json;
  final WineService _wineService;

  CountryPickerModel(
      {@required JsonService json, @required WineService wineService})
      : _json = json,
        _wineService = wineService;

  List<Country> get countries => _json.countries;

  Country _country;

  Country get country => _country;

  void setCountry(int index) {
    _country = countries[index];
    _wineService.addWine.country = _country.name;
    notifyListeners();
  }
}
