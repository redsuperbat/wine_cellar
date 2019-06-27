import 'package:wine_cellar/core/services/settings_service.dart';

import '../base_model.dart';

class SettingsModel extends BaseModel {
  final Settings _settings;

  SettingsModel({Settings settings}) : _settings = settings;

  String get currency => _settings.currency;

  void setCurrency(String value){
    value = _settings.currency;
    notifyListeners();
  }
}
