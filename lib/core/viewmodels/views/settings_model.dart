import 'package:wine_cellar/core/services/settings_service.dart';
import 'package:wine_cellar/core/services/wine_db_service.dart';

import '../base_model.dart';

class SettingsModel extends BaseModel {
  final Settings _settings;
  final WineDb _db;

  SettingsModel({Settings settings, WineDb db})
      : _settings = settings,
        _db = db;

  String get currency => _settings.currency;

  Future<void> clearPrefs() async {
    await _settings.clearSettings();
    await _db.dropDatabase();
    await _db.iniDb();
    notifyListeners();
  }

  void setCurrency(String value) {
    _settings.currency = value;
    _settings.setCurrency(value);
    notifyListeners();
  }
}
