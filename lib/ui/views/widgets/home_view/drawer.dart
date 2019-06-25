import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/views/home_model.dart';

class MyDrawer extends StatelessWidget {
  final HomeModel model;

  MyDrawer({this.model});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            color: Colors.red,
          ),
          ListTile(
            title: Text("Export/Import"),
            trailing: Icon(Icons.import_export),
            onTap: () => Navigator.pushNamed(context, 'export'),
          ),
          ListTile(
            title: Text("Statistics"),
            trailing: Icon(Icons.graphic_eq),
            onTap: () => Navigator.pushNamed(context, 'statistics'),
          ),
          ListTile(
            title: Text("Settings"),
            trailing: Icon(Icons.settings),
            onTap: () => Navigator.pushNamed(context, 'settings'),
          ),
        ],
      ),
    );
  }
}
