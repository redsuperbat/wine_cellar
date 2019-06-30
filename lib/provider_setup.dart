import 'package:provider/provider.dart';

import 'core/services/api.dart';
import 'core/services/json_service.dart';
import 'core/services/settings_service.dart';
import 'core/services/wine_db_service.dart';
import 'core/services/wine_service.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: WineDb()),
  Provider.value(value: JsonService()),
  Provider.value(value: Settings()),
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<WineDb, WineService>(
    //The initial builder can instantiate some value for you if you want
    //initialBuilder: (wineService) => wineService.instantiateSomeValue(),
    builder: (context, db, wineService) => WineService(database: db),
  ),
  ProxyProvider<WineDb, Api>(
    builder: (context, db, api) => Api(db),
  ),
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
/*  example of a StreamProvider
StreamProvider<User>(
    builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
  )*/
];
