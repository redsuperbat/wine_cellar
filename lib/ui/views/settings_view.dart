import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/views/settings_model.dart';
import '../constants.dart';
import 'base_widget.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<SettingsModel>(
      model: SettingsModel(settings: Provider.of(context)),
      builder: (context, model, child) => Scaffold(
            appBar: AppBar(),
            body: Column(
              children: <Widget>[
                DropdownButton(
                  value: model.currency,
                  items: currencies
                      .map(
                        (c) => DropdownMenuItem<String>(
                              child: Text(c),
                              value: c,
                            ),
                      )
                      .toList(),
                  onChanged: (value) => model.setCurrency(value),
                )
              ],
            ),
          ),
    );
  }
}
