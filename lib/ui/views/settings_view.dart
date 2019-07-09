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
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      IconData(0xf0d6, fontFamily: 'Currency'),
                      size: 40,
                      color: mainColor,
                    ),
                    title: Text("Change currency"),
                    subtitle: DropdownButton(
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
                    ),
                  ),
                  ListTile(
                    onTap: () => model.clearPrefs(),
                    leading: Icon(
                      Icons.cancel,
                      size: 40,
                      color: mainColor,
                    ),
                    title: Text("Reset your preferences"),
                    subtitle: Text(
                        "If you reset your preferences you will delete the names of your databases"),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
