import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/views/add_model.dart';

import 'base_widget.dart';
import 'widgets/add_view/bottle_amount.dart';
import 'widgets/add_view/country_picker.dart';
import 'widgets/add_view/picker.dart';
import 'widgets/add_view/vintage_picker.dart';
import 'package:wine_cellar/ui/views/shared/wine_form.dart';
import 'widgets/add_view/wine_image.dart';

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AddModel>(
      model: AddModel(
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
                  WineForm(add: true,),
                  Picker(),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Spacer(),
                      CountryPicker(),
                      Spacer(),
                      BottleAmount(),
                      Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  VintagePicker(),
                  RaisedButton(
                    onPressed: () async {
                      await model.addWineToDb();
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
