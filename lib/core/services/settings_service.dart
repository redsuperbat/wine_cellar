import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  String _currency = "SEK";
  SharedPreferences _prefs;

  String get currency => _currency;

  Settings() {
    getSettings();
  }

  Future<void> getSettings() async {
    _prefs = await SharedPreferences.getInstance();
    _currency = _prefs.getString('currency');
  }

  void setCurrency(String currency) {
    _prefs.setString('currency', currency);
  }
}
