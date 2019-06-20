import 'package:get_it/get_it.dart';

import 'core/services/json_service.dart';
import 'core/services/json_storage.dart';
import 'core/services/wine_db_service.dart';
import 'core/services/wine_service.dart';
import 'core/viewmodels/add_model.dart';
import 'core/viewmodels/home_model.dart';
import 'core/viewmodels/search_model.dart';
import 'core/viewmodels/wine_model.dart';

GetIt locator = GetIt();

void setupLocator() {
  print("im setting up my locator");
  // Example of Lazy singleton, does not contain anything but static methods
  // locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => WineDb());
  locator.registerLazySingleton(() => WineService());
  locator.registerLazySingleton(() => JsonStorage());
  locator.registerLazySingleton(() => JsonService());

  // Example of model  locator.registerFactory(() => ProfileModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => AddModel());
  locator.registerFactory(() => SearchModel());
  locator.registerFactory(() => WineModel());
}
