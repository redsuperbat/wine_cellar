import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/views/home_model.dart';

class MyDrawer extends StatelessWidget {
  final HomeModel model;

  MyDrawer({this.model});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                child: InkWell(
                  onTap: () => print("hello"),
                ),
              ),
              CircleAvatar()
            ],
            currentAccountPicture: CircleAvatar(),
            accountName: Container(            ),
            accountEmail: Container(child: Text("HELLO"),),
          ),
          ListTile(
            title: Text("Export/Import"),
            trailing: Icon(Icons.import_export),
            onTap: () => Navigator.pushNamed(context, 'export'),
          ),
          ListTile(
            title: Text("Statistics"),
            trailing: Icon(Icons.graphic_eq),
            onTap: () => Navigator.pushReplacementNamed(context, 'statistics'),
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
