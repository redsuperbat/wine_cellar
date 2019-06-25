/*
this is where you place all of your routes, preferably with the help of an enum
*/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'views/add_view.dart';
import 'views/export_view.dart';
import 'views/home_view.dart';
import 'views/settings_view.dart';
import 'views/statistics_view.dart';
import 'views/wine_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'add':
        return MaterialPageRoute(builder: (_) => Add());
      case 'wine':
        return MaterialPageRoute(builder: (_) => WineView());
      case 'export':
        return MaterialPageRoute(builder: (_) => ExportView());
      case 'settings':
        return MaterialPageRoute(builder: (_) => SettingsView());
      case 'statistics':
        return MaterialPageRoute(builder: (_) => StatisticsView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
