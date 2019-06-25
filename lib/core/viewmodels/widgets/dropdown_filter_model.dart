import 'package:wine_cellar/core/services/json_service.dart';
import 'package:wine_cellar/core/services/wine_service.dart';
import 'package:wine_cellar/core/viewmodels/views/home_model.dart';

import '../base_model.dart';

class DropdownFilterModel extends BaseModel {
  final JsonService json;
  final WineService wineService;

  DropdownFilterModel({this.json, this.wineService});

  String type = "show all";

  @override
  void dispose() {
    print("Disposing dropdownfiltermodel");
    super.dispose();
  }

  Future setSubType(String value) async {
    wineService.subTypeSink.add(value);
    print("Setting subtype to $value");
    wineService.subCategory = value;
    await wineService.filterWine();
  }

  void setType(String value) async {
    print("Setting type to $value");
    wineService.category = value;
    type = value;
  }

  Future getAllWine() async {
    wineService.subTypeSink.add("show all");
    await wineService.getAllWine();
  }

  List<String> get category => ["show all", "Type", "Size"];

  List<String> get sizes => json.sizes;

  List<String> get types => json.types;
}
