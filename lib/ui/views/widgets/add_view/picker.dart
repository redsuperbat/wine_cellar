import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/widgets/picker_model.dart';

import '../../base_widget.dart';

class Picker extends StatelessWidget {
/*  final Text hint;
  final List<String> items;
  final String value;
  final Function setter;
  final Icon icon;
  final Widget underline;

  const Picker(
      {Key key,
      this.hint,
      this.value,
      this.setter,
      this.items,
      this.icon,
      this.underline})
      : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PickerModel>(
      model: PickerModel(Provider.of(context), Provider.of(context)),
      builder: (context, model, child) => Row(
        children: <Widget>[
          Spacer(),
          DropdownButton<String>(
            value: model.wine.size,
            hint: Text("Size of bottle(s)"),
            onChanged: (newValue) => model.setSize(newValue),
            items: model.sizes
                .map((value) => DropdownMenuItem<String>(
                value: value, child: Text(value)))
                .toList(),
          ),
          Spacer(),
          DropdownButton<String>(
            value: model.wine.type,
            hint: Text("Type of wine"),
            onChanged: (newValue) => model.setType(newValue),
            items: model.types
                .map((value) => DropdownMenuItem<String>(
                value: value, child: Text(value)))
                .toList(),
          ),
          Spacer(),
        ],
      ),
    );
  }




}
