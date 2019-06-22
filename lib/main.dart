import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_setup.dart';
import 'ui/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
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
      ),
    );
  }
}
