import 'dart:async';
import 'dart:math';
import 'package:wine_cellar/ui/constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  String currency = "SEK";
  SharedPreferences _prefs;
  List<String> cellars = [];
  List<int> userColors = [];

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
    await _prefs.clear();
  }
}
