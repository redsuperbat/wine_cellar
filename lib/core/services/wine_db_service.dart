import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';
import 'package:wine_cellar/core/models/wine.dart';

class WineDb {
  Database database;
  bool exists;

  Future<void> iniDb() async {
    print("Im creating my database");
    database = await openDatabase(
      join(await getDatabasesPath(), 'wine_database.db'),
      onCreate: (db, version) => db.execute("CREATE TABLE wines("
          "id INTEGER PRIMARY KEY, "
          "name TEXT, "
          "vintage INTEGER, "
          "location TEXT, "
          "aoo TEXT, "
          "country TEXT, "
          "type TEXT, "
          "grapes TEXT, "
          "size TEXT, "
          "owned INTEGER, "
          "time TEXT, "
          "comment TEXT, "
          "rating DOUBLE, "
          "price DOUBLE, "
          "image TEXT)"),
      version: 1,
    );
    print("im finished with creating the database");
  }

  Future<void> insertWine(Wine wine) async {
    await database.insert('wines', wine.toJson());
  }

  Future<double> getCellarWorth() async {
    double sum = 0;
    final data = await database.rawQuery("SELECT price, owned FROM wines");
    data.forEach((m) => sum = sum + m['price'] * m['owned']);
    print('Data is: $data sum is $sum');
    return sum;
  }

  Future<int> getStatistics({String column, String shouldEqual}) async {
    int sum = 0;
    if (column != null && shouldEqual != null) {
      final data = await database.rawQuery(
          "SELECT type, owned FROM wines WHERE $column = '$shouldEqual'");
      data.forEach((m) => sum = sum + m['owned']);
    } else {
      final data = await database.rawQuery("SELECT type, owned FROM wines");
      data.forEach((m) => sum = sum + m['owned']);
    }
    return sum;
  }

  Future<List<Wine>> getAllWines({String orderBy = 'time'}) async {
    final List<Map<String, dynamic>> _wines =
        await database.query('wines', orderBy: '$orderBy DESC');
    List<Wine> wines = [];
    _wines.forEach((w) => wines.add(Wine.fromJson(w)));
    return wines;
  }

  Future<int> getId() async {
    int data = Sqflite.firstIntValue(
        await database.rawQuery("SELECT COUNT(*) FROM wines"));
    print(data);
    return data + 1;
  }

  Future<void> updateWine(Wine wine) async {
    await database
        .update('wines', wine.toJson(), where: "id = ?", whereArgs: [wine.id]);
  }

  Future<List<Wine>> filterWine({String query, String column}) async {
    final List<Map<String, dynamic>> _wines =
        await database.query('wines', where: '$column = ?', whereArgs: [query]);
    List<Wine> wines = [];
    _wines.forEach((w) => wines.add(Wine.fromJson(w)));
    return wines;
  }

  Future<List<Wine>> searchWine(String name) async {
    final List<Map<String, dynamic>> _wines = await database
        .query('wines', where: "name LIKE ?", whereArgs: ['%$name%']);
    List<Wine> wines = [];
    _wines.forEach((w) => wines.add(Wine.fromJson(w)));
    return wines;
  }

  void deleteWine(int id) {
    database.delete('wines', where: "id = ?", whereArgs: [id]);
  }

  Future dropDatabase() async {
    await database.close();
    await deleteDatabase(database.path);
  }
}
