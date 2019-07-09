import 'package:wine_cellar/core/services/settings_service.dart';

import '../base_model.dart';

class SettingsModel extends BaseModel {
  final Settings _settings;

  SettingsModel({Settings settings}) : _settings = settings;

  String get currency => _settings.currency;

  Future<void> clearPrefs()async{
    await _settings.clearSettings();
  }


  void setCurrency(String value){
    _settings.currency = value;
    _settings.setCurrency(value);
    notifyListeners();
  }
}
