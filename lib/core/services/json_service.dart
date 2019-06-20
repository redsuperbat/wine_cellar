import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:wine_cellar/core/models/country.dart';

class JsonService {
  final List<Country> _countries = [];
  List<String> _sizes;
  List<String> _types;

  List<Country> get countries => _countries;

  List<String> get sizes => _sizes;

  List<String> get types => _types;


  Future<void> loadAssets() async {
    print("im loading assets");
    List response = json
        .decode(await rootBundle.loadString('assets/text/country_data.json'));
    response.forEach((c) => _countries.add(Country.fromJson(c)));
    _sizes = json
        .decode(await rootBundle.loadString('assets/text/wine_sizes.json'))
        .cast<String>();
    _types = json
        .decode(await rootBundle.loadString('assets/text/wine_types.json'))
        .cast<String>();
    print(_sizes);
  }
}
