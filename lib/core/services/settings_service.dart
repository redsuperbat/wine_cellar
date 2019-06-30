import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  String currency = "SEK";
  SharedPreferences _prefs;

  Settings() {
    getSettings();
  }

  Future<void> getSettings() async {
    _prefs = await SharedPreferences.getInstance();
    currency = _prefs.getString('currency') ?? "SEK";
  }

  void setCurrency(String currency) {
    _prefs.setString('currency', currency);
  }
}
