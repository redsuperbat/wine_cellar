import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/add_model.dart';

class VintagePicker extends StatelessWidget {
  final AddModel model;

  VintagePicker({this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 15,),
            Text(
              "Select vintage",
              style: TextStyle(fontSize: 15),
            ),
            Spacer(),
            Text('Non-vintage?'),
            Checkbox(
                value: model.isChecked, onChanged: (value) => model.change())
          ],
        ),
        model.isChecked
            ? Container()
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(20)),
                height: 100,
                child: YearPicker(
                  selectedDate: model.selected,
                  onChanged: (value) => model.setYear(value),
                  firstDate: DateTime(1850),
                  lastDate: DateTime.now(),
                ),
              ),
      ],
    );
  }
}
