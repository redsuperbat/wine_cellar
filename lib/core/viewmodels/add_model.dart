import 'dart:io';

import 'package:wine_cellar/core/models/country.dart';
import 'package:flutter/material.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/json_service.dart';
import 'package:wine_cellar/core/services/wine_db_service.dart';
import 'package:wine_cellar/core/services/wine_service.dart';
import '../../locator.dart';
import 'package:image_picker/image_picker.dart';

import 'base_model.dart';

class AddModel extends BaseModel {
  WineService wineService = locator<WineService>();
  JsonService _json = locator<JsonService>();
  WineDb _db = locator<WineDb>();

  //variables for the new wines
  DateTime selected = DateTime.now();
  Country _country;
  int amountOfBottles = 1;
  File image;
  String type;
  bool isChecked = false;
  String size;

  final List<Country> _countries = [];
  final TextEditingController grapeCont = TextEditingController();
  final TextEditingController nameProdCont = TextEditingController();
  final TextEditingController counterCont = TextEditingController(text: '1');
  final TextEditingController aooCont = TextEditingController();

  //Getters
  List<Country> get countries => _countries;

  Country get country => _country;

  //constructor with initializing methods
  AddModel() {
    counterCont.addListener(_listener);
    loadCountries();
  }

  Future<void> loadCountries() async {
    List data = await _json.getCountries();
    data.forEach((c) => _countries.add(Country.fromJson(c)));
  }

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
    if(amountOfBottles != 999) {
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
    Wine wine = Wine(
      id: wineService.wines.length + 1,
      owned: amountOfBottles,
      name: nameProdCont.text ?? "",
      aoo: aooCont.text ?? "",
      grapes: grapeCont.text ?? "",
      vintage: isChecked ? "NV" : selected.year.toString(),
      type: type ?? "",
      size: size ?? "",
      country: country == null ? "" : country.name,
      image: image == null ? null : image.path,
      time: DateTime.now().toString(),
    );
    print(wine.id);
    await wineService.insert(wine);
  }
}
