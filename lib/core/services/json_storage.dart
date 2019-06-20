import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:wine_cellar/core/models/wine.dart';

class JsonStorage {
  final String fileName = 'cellarWines.json';
  File jsonFile;
  Directory dir;
  List fileContent;
  bool exists;

  Future<void> iniStorage() async {
    dir = await getApplicationDocumentsDirectory();
    print(dir.toString());
    jsonFile = File('${dir.path}/$fileName');
    exists = await jsonFile.exists();
    print(exists);
    if (!exists) createJsonFile();
    fileContent = json.decode(await jsonFile.readAsString());
    print(fileContent);
  }


  Future<void> createJsonFile() async {
    print('creating file');
    jsonFile.createSync();
    exists = true;
    await jsonFile.writeAsString(json.encode([]));
  }

  void removeFromFile() {
    if (exists) {
      jsonFile.delete();
    }
  }

  Future<void> writeToFile({Wine wine}) async {
    if (exists) {
      print("File exists");
      List jsonFileContent = json.decode(await jsonFile.readAsString());
      jsonFileContent.add(wine.toJson());
      await jsonFile.writeAsString(json.encode(jsonFileContent));
    }
  }
}
