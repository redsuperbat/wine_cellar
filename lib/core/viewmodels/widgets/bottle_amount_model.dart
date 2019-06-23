import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_service.dart';

import '../base_model.dart';
import 'package:flutter/material.dart';

class BottleAmountModel extends BaseModel {
  final TextEditingController _controller = TextEditingController(text: '1');
  final WineService _wineService;

  BottleAmountModel({WineService wineService}) : _wineService = wineService;

  TextEditingController get controller => _controller;

  Wine get wine => _wineService.addWine;

  void increment() {
    if (wine.owned != 999) {
      wine.owned++;
      controller.text = '${wine.owned}';
    }
  }

  void decrement() {
    if (wine.owned != 0) {
      wine.owned--;
      controller.text = '${wine.owned}';
    }
  }
}
