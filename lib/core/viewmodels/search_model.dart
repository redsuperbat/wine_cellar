import 'package:wine_cellar/core/enums/viewstate.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_db_service.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../../locator.dart';
import 'base_model.dart';
import 'package:flutter/material.dart';

class SearchModel extends BaseModel {
  WineService _wineService = locator<WineService>();
  WineDb _db = locator<WineDb>();

  List<Wine> _wines;

  final TextEditingController controller = TextEditingController();

  String get text => controller.text;

  List<Wine> get wines => _wines;

  SearchModel() {
    controller.addListener(_listener);
    _wines = List<Wine>.from(_wineService.wines);
  }

  void _listener() async {
    setState(ViewState.Busy);
    _wines = await _db.searchWine(controller.text);
    _wines.sort((first, second) => first.time.compareTo(second.time));
    setState(ViewState.Idle);
  }

  void injectWine(Wine wine) {
    _wineService.viewWine = wine;
  }

  void decrementWine(Wine wine) {
    if (wine.owned == 1) _wines.remove(wine);
    _wineService.decrementWine(wine);
    notifyListeners();
  }

  void removeWine(Wine wine) {
    print(_wines.remove(wine));
    _wineService.removeWine(wine);
    notifyListeners();
  }
}
