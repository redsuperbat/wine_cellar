import 'dart:io';

import 'package:wine_cellar/core/models/country.dart';
import 'package:flutter/material.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/json_service.dart';
import 'package:wine_cellar/core/services/wine_service.dart';
import 'package:image_picker/image_picker.dart';

import 'package:wine_cellar/core/viewmodels/base_model.dart';

class AddModel extends BaseModel {
  /*WineService _wineService = locator<WineService>();
  JsonService _json = locator<JsonService>();*/

  final JsonService _json;
  final WineService _wineService;

  AddModel({@required JsonService json, @required WineService wineService})
      : _json = json,
        _wineService = wineService {
    counterCont.addListener(_listener);
  }

  //variables for the new wines
  DateTime selected = DateTime.now();
  Country _country;
  int amountOfBottles = 1;
  File image;
  String type;
  bool isChecked = false;
  String size;

  final TextEditingController grapeCont = TextEditingController();
  final TextEditingController nameProdCont = TextEditingController();
  final TextEditingController counterCont = TextEditingController(text: '1');
  final TextEditingController aooCont = TextEditingController();
  final TextEditingController priceCont = TextEditingController();

  //Getters
  List<Country> get countries => _json.countries;

  List<String> get sizes => _json.sizes;

  List<String> get types => _json.types;

  Country get country => _country;

  void setCountry(int index) {
    _country = countries[index];
    notifyListeners();
  }

  void setType(String value) {
    type = value;
    notifyListeners();
  }

  void setYear(DateTime value) {
    selected = value;
    notifyListeners();
  }

  void setSize(String _size) {
    size = _size;
    notifyListeners();
  }

  void increment() {
    if (amountOfBottles != 999) {
      amountOfBottles++;
      counterCont.text = '$amountOfBottles';
    }
  }

  void decrement() {
    if (amountOfBottles != 0) {
      amountOfBottles--;
      counterCont.text = '$amountOfBottles';
    }
  }

  void _listener() {
    amountOfBottles = int.parse(counterCont.text);
  }

  Future<void> getImage() async {
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    notifyListeners();
  }

  void change() {
    isChecked = !isChecked;
    notifyListeners();
  }

  void addWineToDb() async {
    print(priceCont.text ?? 'null');
    Wine wine = Wine(
        id: _wineService.wines.length + 1,
        owned: amountOfBottles,
        name: nameProdCont.text ?? "",
        country: country != null ? country.name : "",
        aoo: aooCont.text ?? "",
        location: country == null && aooCont.text == null
            ? ""
            : '${country != null ? country.name : ""}, ${aooCont.text ?? ""}',
        grapes: grapeCont.text ?? "",
        vintage: isChecked ? "NV" : selected.year.toString(),
        type: type ?? "",
        size: size ?? "",
        image: image == null ? null : image.path,
        time: DateTime.now().toString(),
        price: double.parse(priceCont.text == "" ? '0' : priceCont.text));
    await _wineService.insert(wine);
  }
}
