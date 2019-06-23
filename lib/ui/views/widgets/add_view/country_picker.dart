import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/widgets/country_picker_model.dart';

import '../../base_widget.dart';
import 'country_dialog.dart';

class CountryPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<CountryPickerModel>(
      model: CountryPickerModel(
          json: Provider.of(context), wineService: Provider.of(context)),
      builder: (context, model, child) => model.country == null
          ? RaisedButton(
              child: Text("Wine origin country"),
              onPressed: () => showDialog(
                    context: context,
                    builder: (_) => CountryDialog(model: model),
                  ),
            )
          : Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 60,
              child: InkWell(
                onTap: () => showDialog(
                      context: context,
                      builder: (_) => CountryDialog(model: model),
                    ),
                child: Card(
                  color: Colors.grey[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        model.country.flag,
                        width: 60,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(model.country.name),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
