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

  List<Profile> get profiles => _settings.profiles;

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

  void loadProfiles(){
    _settings.loadProfiles();
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
