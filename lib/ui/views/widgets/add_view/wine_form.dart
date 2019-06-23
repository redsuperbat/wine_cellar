import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/views/add_model.dart';
import 'package:wine_cellar/core/viewmodels/widgets/wine_form_model.dart';

import '../../base_widget.dart';

class WineForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("wineform rebuilt");
    return BaseWidget<WineFormModel>(
      model: WineFormModel(wineService: Provider.of(context)),
      builder: (context, model, child) => Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: model.nameController,
                  decoration:
                      InputDecoration(hintText: 'Brand Name & Wine Producer'),
                ),
                TextField(
                  controller: model.grapeController,
                  decoration: InputDecoration(hintText: 'Grapes'),
                ),
                TextField(
                  controller: model.aooController,
                  decoration: InputDecoration(
                    suffixIcon: Tooltip(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        message:
                            'Where the wine originates from. \nEg. Bourgogne, Bourdeaux or Napa-Valley',
                        child: Icon(
                          Icons.info,
                        )),
                    hintText: 'Appellation of origin',
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: model.priceController,
                  inputFormatters: <TextInputFormatter>[
                    // WhitelistingTextInputFormatter('[0-9.]'), Implement me
                  ],
                  decoration: InputDecoration(hintText: 'Purchase price'),
                ),
              ],
            ),
          ),
    );
  }
}
