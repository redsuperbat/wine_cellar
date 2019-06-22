import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/views/add_model.dart';

import 'base_widget.dart';
import 'widgets/add_view/bottle_amount.dart';
import 'widgets/add_view/country_picker.dart';
import 'widgets/add_view/picker.dart';
import 'widgets/add_view/vintage_picker.dart';
import 'widgets/add_view/wine_form.dart';
import 'widgets/add_view/wine_image.dart';

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AddModel>(
      model: AddModel(
        json: Provider.of(context),
        wineService: Provider.of(context),
      ),
      builder: (context, model, child) => Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Add more wine to your cellar",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  WineImage(
                    model: model,
                  ),
                  WineForm(model: model),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Spacer(),
                      Picker(
                        hint: Text('Size of bottle(s)'),
                        setter: (value) => model.setSize(value),
                        value: model.size,
                        items: model.sizes,
                      ),
                      Spacer(),
                      Picker(
                        hint: Text('Type of Wine'),
                        setter: (value) => model.setType(value),
                        value: model.type,
                        items: model.types,
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Spacer(),
                      CountryPicker(model: model),
                      Spacer(),
                      BottleAmount(
                        model: model,
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  VintagePicker(model: model),
                  RaisedButton(
                    onPressed: () {
                      model.addWineToDb();
                      Navigator.pop(context);
                    },
                    child: Text("Add to Cellar"),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
