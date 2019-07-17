import 'package:wine_cellar/core/services/database_service.dart';
import 'package:wine_cellar/core/services/profile_service.dart';
import 'package:wine_cellar/core/services/settings_service.dart';

import '../base_model.dart';

class SettingsModel extends BaseModel {
  final Settings _settings;
  final DatabaseService _db;
  final ProfileService _profile;

  SettingsModel({Settings settings, DatabaseService db, ProfileService profile})
      : _settings = settings,
        _db = db,
        _profile = profile;

  String get currency => _settings.currency;

  Future<void> deleteDb() async {
    await _db.dropDatabase();
    _profile.profileSink.add([]);
  }

  void setCurrency(String value) {
    _settings.currency = value;
    _settings.setCurrency(value);
    notifyListeners();
  }
}
