import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/widgets/picker_model.dart';
import '../../../constants.dart';

import '../../base_widget.dart';

class Picker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<PickerModel>(
      model: PickerModel(Provider.of(context)),
      builder: (context, model, child) => Row(
            children: <Widget>[
              Spacer(),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton<String>(
                    underline: Container(),
                    value: model.wine.size,
                    hint: Text("Size of bottle(s)"),
                    onChanged: (newValue) => model.setSize(newValue),
                    items: wineSizes
                        .map((value) => DropdownMenuItem<String>(
                            value: value, child: Text(value)))
                        .toList(),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton<String>(
                    underline: Container(),
                    value: model.wine.type,
                    hint: Text("Type of wine"),
                    onChanged: (newValue) => model.setType(newValue),
                    items: wineCategories
                        .map((value) => DropdownMenuItem<String>(
                            value: value, child: Text(value)))
                        .toList(),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
    );
  }
}
