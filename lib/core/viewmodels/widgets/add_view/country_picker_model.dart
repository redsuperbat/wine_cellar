import 'dart:async';

import 'package:meta/meta.dart';
import 'package:wine_cellar/core/models/country.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/json_service.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../../base_model.dart';

class CountryPickerModel extends BaseModel {
  final JsonService _json;
  final WineService _wineService;
  StreamSubscription subscription;

  CountryPickerModel(
      {@required JsonService json, @required WineService wineService})
      : _json = json,
        _wineService = wineService {
    subscription = wineStream.listen((wine) => setWineCountry(wine));
  }

  Stream<Wine> get wineStream => _wineService.wineStream;

  List<Country> get countries => _json.countries;

  Country _country;

  Country get country => _country;

  @override
  void dispose() {
    print("Disposing of countrypicker");
    subscription.cancel();
    super.dispose();
  }

  void setWineCountry(Wine wine) {
    _country =
        countries.firstWhere((c) => wine.country == c.name, orElse: () => null);
    notifyListeners();
  }

  void setCountry(int index) {
    _country = countries[index];
    _wineService.wine.country = _country.name;
    notifyListeners();
  }
}
