import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:wine_cellar/core/models/country.dart';

class JsonService {
  final List<Country> _countries = [];

  List<Country> get countries => _countries;

  Future<void> loadAssets() async {
    if (_countries.length == 0) {
      print("im loading assets");
      List response = json
          .decode(await rootBundle.loadString('assets/text/country_data.json'));
      response.forEach((c) => _countries.add(Country.fromJson(c)));
    }
  }
}
