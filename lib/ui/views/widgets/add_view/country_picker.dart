import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/views/add_model.dart';

import 'country_dialog.dart';

class CountryPicker extends StatelessWidget {
  final AddModel model;

  CountryPicker({this.model});

  @override
  Widget build(BuildContext context) {
    return model.country == null
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
          );
  }
}
