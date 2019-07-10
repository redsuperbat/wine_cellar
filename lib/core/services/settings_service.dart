import 'dart:async';
import 'dart:math';
import 'package:wine_cellar/core/models/profile.dart';
import 'package:wine_cellar/ui/constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  String currency = "SEK";
  SharedPreferences _prefs;
  List<String> cellars = [];
  List<int> userColors = [];
  List<Profile> profiles = [];

  Future<void> getSettings() async {
    if (_prefs == null) {
      print("Getting settings");
      _prefs = await SharedPreferences.getInstance();
      currency = _prefs.getString('currency') ?? "SEK";
      cellars = _prefs.getStringList('cellars') ?? [];
      userColors = _prefs
              .getStringList('userColors')
              ?.map((string) => int.parse(string))
              ?.toList() ??
          [];
    }
  }

  void loadProfiles() {
    profiles.clear();
    for (var i = 0; i < cellars.length; i++) {
      profiles.add(
        Profile(
          index: i == 0 ? 'one' : i == 1 ? 'two' : 'three',
          cellarName: cellars[i],
          isDefault: i == 0 ? true : false,
          color: userColors[i],
        ),
      );
    }
    print(profiles);
  }

  void setCellarName(String name) {
    cellars.add(name);
    final _random = new Random();
    userColors.add(colors[_random.nextInt(colors.length)]);
    _prefs.setStringList('cellars', cellars);
    _prefs.setStringList(
        'userColors', userColors.map((int) => int.toString()).toList());
  }

  void setCurrency(String currency) {
    _prefs.setString('currency', currency);
  }

  Future clearSettings() async {
    cellars = [cellars[0]];
    profiles = [profiles[0]];
    userColors = [userColors[0]];
    _prefs.setStringList('cellars', cellars);
    _prefs.setStringList(
        'userColors', userColors.map((s) => s.toString()).toList());
  }
}
