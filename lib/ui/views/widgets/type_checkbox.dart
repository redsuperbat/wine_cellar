import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/home_model.dart';

class TypeCheckbox extends StatelessWidget {
  final bool type;
  final String title;
  final HomeModel model;

  TypeCheckbox({Key key, this.type, this.title, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(title),
        Checkbox(
          value: type,
          onChanged: (value) => model.filterType(title, type),
        ),
      ],
    );
  }
}
