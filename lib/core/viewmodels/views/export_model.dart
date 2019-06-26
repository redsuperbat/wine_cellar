import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/services/wine_db_service.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:csv/csv.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../base_model.dart';

class ExportModel extends BaseModel {
  final WineDb _db;

  ExportModel({WineDb db}) : _db = db;

  List<Wine> wines;

  List<List<dynamic>> rows = [];

  Future getCurrentDatabase() async {
    wines = await _db.getAllWines();
  }

  Future exportToCsv() async {
    await getCurrentDatabase();
    for (int i = 0; i < wines.length; i++) {
      List<dynamic> row = List();
      row.add(wines[i].name);
      row.add(wines[i].type);
      row.add(wines[i].aoo);
      row.add(wines[i].country);
      row.add(wines[i].location);
      row.add(wines[i].vintage);
      row.add(wines[i].id);
      row.add(wines[i].grapes);
      row.add(wines[i].owned);
      row.add(wines[i].size);
      row.add(wines[i].image);
      row.add(wines[i].time);
      row.add(wines[i].comment);
      row.add(wines[i].price);
      row.add(wines[i].rating);
      rows.add(row);
    }
    await SimplePermissions.requestPermission(Permission. WriteExternalStorage);
    bool checkPermission=await SimplePermissions.checkPermission(Permission.WriteExternalStorage);
    if(checkPermission) {

//store file in documents folder

     final String dir = (await getExternalStorageDirectory()).absolute.path + "/documents";
      print("The file is at: $dir/filename.csv");
      final File f =  File("$dir/filename.csv");

// convert rows to String and write as csv file

      String csv = const ListToCsvConverter().convert(rows);
      f.writeAsString(csv);
    }

  }
}
