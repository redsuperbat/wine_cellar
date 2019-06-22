/*
this is where you place all of your routes, preferably with the help of an enum
*/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wine_cellar/core/models/wine.dart';

import 'views/add_view.dart';
import 'views/home_view.dart';
import 'views/searching_view.dart';
import 'views/wine_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'add':
        return MaterialPageRoute(builder: (_) => Add());
      case 'search':
        return MaterialPageRoute(builder: (_) => SearchView(),);
      case 'wine':
        return MaterialPageRoute(builder: (_) => WineView());
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
