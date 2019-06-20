import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/add_model.dart';

class TypePicker extends StatelessWidget {
  final AddModel model;

  TypePicker({@required this.model});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: model.type,
      hint: Text("Type of wine"),
      onChanged: (String newValue) => model.setType(newValue),
      items: <String>[
        'Red',
        'White',
        'Rosé',
        'Sparkling White',
        'Sparkling Rosé',
        'Sweet'
      ]
          .map(
            (value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
          )
          .toList(),
    );
  }
}
