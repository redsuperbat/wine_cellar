import 'package:flutter/material.dart';
import 'package:wine_cellar/core/models/profile.dart';
import 'package:wine_cellar/core/viewmodels/views/home_model.dart';

import '../../../constants.dart';
import 'welcome_dialog.dart';

class MyDrawer extends StatelessWidget {
  final HomeModel model;

  MyDrawer({this.model});

  @override
  Widget build(BuildContext context) {
    print(model.profiles);
    print(model.profiles.length);
    return Drawer(
      child: Column(
        children: <Widget>[
          Card(
            color: accentColor,
            child: InkWell(
              splashColor: mainColor,
              onTap: (){},
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                otherAccountsPictures: <Widget>[
                  AlternativeCellar(
                    profile: model.profiles.length > 1 ? model.profiles[1] : null,
                    changeCellar: (profile) => model.changeCellar(profile),
                    addCellar: (name) => model.createCellar(name),
                  ),
                  AlternativeCellar(
                    profile: model.profiles.length > 2 ? model.profiles[2] : null,
                    changeCellar: (profile) => model.changeCellar(profile),
                    addCellar: (name) => model.createCellar(name),
                  ),
                ],
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color(model.profiles[0].color ?? 1),
                  foregroundColor: Colors.white,
                  child: Text(
                    model.profiles[0].cellarName.substring(0, 1).toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                accountName: Container(),
                accountEmail: Container(
                  child: Text(
                    model.profiles[0].cellarName,
                    style: TextStyle(color: Colors.white,fontSize: 20),
                  ),
                ),
              ),
            ),
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
          Spacer(),
          ListTile(
            title: Text("Settings"),
            trailing: Icon(Icons.settings),
            onTap: () => Navigator.pushNamed(context, 'settings'),
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}

class AlternativeCellar extends StatelessWidget {
  final Profile profile;
  final Function changeCellar;
  final Function addCellar;

  AlternativeCellar({this.profile, this.changeCellar, this.addCellar});

  @override
  Widget build(BuildContext context) {
    print(profile);
    return profile == null
        ? InkWell(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Container(child: Icon(Icons.add),),
            ),
            onTap: () => showDialog(
                  context: context,
                  builder: (_) => WelcomeDialog(
                        addCellar: addCellar,
                        title: Text("Add a new cellar"),
                        content: Text(
                          "This new cellar will contain no wines,"
                          "\nto change back to your original cellar just press that cellar.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                ),
          )
        : InkWell(
            onTap: () => changeCellar(profile),
            child: CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor: Color(profile.color),
              child: Text(
                profile.cellarName.substring(0, 1),
              ),
            ),
          );
  }
}
