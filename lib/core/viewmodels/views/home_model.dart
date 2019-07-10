import 'package:meta/meta.dart';
import 'package:wine_cellar/core/models/profile.dart';
import 'package:wine_cellar/core/services/settings_service.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import 'package:wine_cellar/core/viewmodels/base_model.dart';

class HomeModel extends BaseModel {
  final WineService _wineService;
  final Settings _settings;

  HomeModel({@required WineService wineService, Settings settings})
      : _wineService = wineService,
        _settings = settings;

  Stream<String> get subType => _wineService.subType;

  List<Profile> profiles = [];

  int counter = 0;

  bool search = false;

  void beginSearch() {
    search = !search;
    notifyListeners();
  }

  void increment(){
    counter++;
  }

  Future<void> iniDb() async {
    setBusy(true);
    await _wineService.initializeDb();
    setBusy(false);
  }

  Future iniSettings() async {
    await _settings.getSettings();
  }

  void loadProfiles() {
    profiles.clear();
    for (var i = 0; i < _settings.cellars.length; i++) {
      profiles.add(
        Profile(
          index: i == 0 ? 'one' : i == 1 ? 'two' : 'three',
          cellarName: _settings.cellars[i],
          isDefault: i == 0 ? true : false,
          color: _settings.userColors[i],
        ),
      );
    }
    print(profiles);
  }

  Future changeCellar(Profile profile) async {
    profiles.remove(profile);
    profiles.insert(0, profile);
    await _wineService.changeCellar(profile.index);
    notifyListeners();
  }

  void setCellarName(String name) {
    _settings.setCellarName(name);
    loadProfiles();
    notifyListeners();
  }

  Future createCellar(String name) async {
    setCellarName(name);
    await _wineService
        .addCellar(profiles.singleWhere((p) => p.cellarName == name).index);
  }

  Future<void> getAllWine() async {
    setBusy(true);
    await _wineService.getAllWine();
    setBusy(false);
  }
}
