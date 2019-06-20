import 'package:flutter/material.dart';
import 'locator.dart';
import 'ui/router.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black87,

        ),
        iconTheme: IconThemeData(color: Colors.red),
        appBarTheme: AppBarTheme(
            textTheme: TextTheme(
                title: TextStyle(color: Colors.black87, fontSize: 24)),
            color: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Color(0xFFc72442))),
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: '/',
    );
  }
}
