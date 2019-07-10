import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/views/settings_model.dart';
import '../constants.dart';
import 'base_widget.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<SettingsModel>(
      model: SettingsModel(
        settings: Provider.of(context),
        db: Provider.of(context),
      ),
      builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("Settings"),
              centerTitle: true,
            ),
            body: Column(
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
                  onTap: () => showDialog(
                        context: context,
                        builder: (_) => SimpleDialog(
                              title: Text(
                                "Are you sure?\nThis will delete your ENTIRE "
                                "wine cellar. You will not be able "
                                "to recover it",
                                textAlign: TextAlign.center,
                              ),
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RaisedButton(
                                      onPressed: () async {
                                        await model.clearPrefs();
                                        Navigator.of(context).popUntil((route) => route.isFirst);
                                      },
                                      color: mainColor,
                                      child: Text(
                                        "Yes, delete",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 35,
                                    ),
                                    RaisedButton(
                                      onPressed: () => Navigator.pop(context),
                                      color: confirmColor,
                                      child: Text(
                                        "No, return",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                      ),
                  leading: Icon(
                    Icons.cancel,
                    size: 40,
                    color: mainColor,
                  ),
                  title: Text("Delete your winecellars"),
                  subtitle:
                      Text("If you delete your database there is no return. "
                          "Export it if you want to keep the data elsewhere."),
                ),
              ],
            ),
          ),
    );
  }
}
