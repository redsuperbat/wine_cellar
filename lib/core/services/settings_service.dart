import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  String _currency;
  SharedPreferences _prefs;

  String get currency => _currency;

  Future<void> getSettings() async {
    _prefs = await SharedPreferences.getInstance();
    _currency = _prefs.getString('currency');
  }

  void setCurrency(String currency) {
    _prefs.setString('currency', currency);
  }
}
