import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/add_model.dart';

import 'base_view.dart';
import 'widgets/add_view/bottle_amount.dart';
import 'widgets/add_view/country_picker.dart';
import 'widgets/add_view/size_picker.dart';
import 'widgets/add_view/type_picker.dart';
import 'widgets/add_view/vintage_picker.dart';
import 'widgets/add_view/wine_form.dart';
import 'widgets/add_view/wine_image.dart';

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<AddModel>(
      builder: (context, model, child) => Scaffold(
            appBar: AppBar(),
            body: Container(
              child: SingleChildScrollView(
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
                        SizePicker(model: model),
                        Spacer(),
                        TypePicker(model: model),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 15,),
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
                    SizedBox(height: 15,),
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
          ),
    );
  }
}
