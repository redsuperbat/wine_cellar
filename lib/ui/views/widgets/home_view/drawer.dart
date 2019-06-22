import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/home_model.dart';


class MyDrawer extends StatelessWidget {
  final HomeModel model;

  MyDrawer({this.model});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(height: MediaQuery.of(context).size.height/5,color: Colors.red,),
          Row(
            children: <Widget>[
              Text("Types: "),
            ],
          )
        ],
      ),
    );
  }
}
