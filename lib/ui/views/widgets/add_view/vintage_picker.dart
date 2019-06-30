import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/widgets/add_view/vintage_picker_model.dart';

import '../../base_widget.dart';
import 'my_year_picker.dart';

class VintagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<VintagePickerModel>(
      model: VintagePickerModel(wineService: Provider.of(context)),
      onModelReady: (model) => model.setYear(DateTime.now().year),
      builder: (context, model, child) => Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Select vintage",
                    style: TextStyle(fontSize: 15),
                  ),
                  Spacer(),
                  Text('Non-vintage?'),
                  Checkbox(
                      value: model.isChecked,
                      onChanged: (value) => model.change())
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
                      child: MyYearPicker(
                        selectedYear: model.selected ?? DateTime.now().year,
                        onChanged: (year) => model.setYear(year),
                        firstYear: 1850,
                        lastYear: DateTime.now().year,
                      ),
                    ),
            ],
          ),
    );
  }
}
