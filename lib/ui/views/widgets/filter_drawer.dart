import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/home_model.dart';

import 'type_checkbox.dart';

class FilterDrawer extends StatelessWidget {
  final HomeModel model;

  FilterDrawer({this.model});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(height: MediaQuery.of(context).size.height/5,color: Colors.red,),
          Row(
            children: <Widget>[
              Text("Types: "),
              for (Map item in model.types)
                TypeCheckbox(
                  model: model,
                  title: item['title'],
                  type: item['type'],
                ),
            ],
          )
        ],
      ),
    );
  }
}
