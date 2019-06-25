import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/widgets/wine_form_model.dart';
import 'package:wine_cellar/ui/views/widgets/wine_view/property_changer.dart';

import '../base_widget.dart';

class WineForm extends StatelessWidget {
  final bool add;

  WineForm({@required this.add});

  @override
  Widget build(BuildContext context) {
    print("wineform rebuilt");
    return BaseWidget<WineFormModel>(
      model: WineFormModel(wineService: Provider.of(context)),
      builder: (context, model, child) => Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: add
                ? Column(
                    children: <Widget>[
                      TextField(
                        controller: model.nameController,
                        decoration: InputDecoration(
                            hintText: 'Brand Name & Wine Producer'),
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
                  )
                : Column(
                    children: <Widget>[
                      PropertyChanger(
                        controller: model.nameController,
                        title: 'Brand name and Wineproducer',
                      ),
                      PropertyChanger(
                        controller: model.grapeController,
                        title: 'Grapes',
                      ),
                      PropertyChanger(
                        controller: model.countryController,
                        title: 'Country',
                      ),
                      PropertyChanger(
                        controller: model.aooController,
                        title: 'Appellation of origin',
                      ),
                      PropertyChanger(
                        controller: model.priceController,
                        keyBoardType: TextInputType.number,
                        title: 'Price',
                      ),
                      PropertyChanger(
                        controller: model.vintageController,
                        keyBoardType: TextInputType.number,
                        title: 'Vintage',
                      ),
                    ],
                  ),
          ),
    );
  }
}
