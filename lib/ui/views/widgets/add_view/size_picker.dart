import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/add_model.dart';

class SizePicker extends StatelessWidget {
  final AddModel model;

  const SizePicker({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: model.size,
      hint: Text("Size of bottle(s)"),
      onChanged: (String newValue) => model.setSize(newValue),
      items: <String>['375mL','750mL', '1.5L', '3L', '6L']
          .map(
            (value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
          ).toList(),
    );
  }
}
