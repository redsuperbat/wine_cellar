import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class JsonService {
  Future<List> getCountries() async {
    List data =
        json.decode(await rootBundle.loadString('assets/country_data.json'));
    return data;
  }
}
