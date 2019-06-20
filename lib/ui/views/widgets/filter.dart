import 'package:flutter/material.dart';

class Filter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      icon: Icon(Icons.filter_list),
      hint: Text("Size of bottle(s)"),
      onChanged: (String newValue) => print(newValue),
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
