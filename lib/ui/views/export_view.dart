import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/views/export_model.dart';

import 'base_widget.dart';
import 'widgets/export_dialog.dart';

class ExportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ExportModel>(
      model: ExportModel(db: Provider.of(context)),
      builder: (context, model, child) => Scaffold(
            appBar: AppBar(),
            body: Column(
              children: <Widget>[
                Flexible(
                  child: Text(
                    "Importing/Exporting CSV",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                Flexible(
                  child: Text(
                    "This is where you can export and import CSV files to your database. "
                    "Right now its only possible to export and import the entire database."
                    "\nIn future versions of Wine Cellar you should be able to only export a part of your winecellar."
                    "The CSV file can be opened by any program such as Microsoft Excel or Google "
                    "sheets for further processing of the data",
                    //textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                model.export
                    ? Column(
                        children: <Widget>[
                          Text("Enter your filename"),
                          TextField(
                            controller: model.controller,
                          ),
                          RaisedButton(
                            onPressed: () {
                              model.exportToCsv();
                              if (model.error)
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (_) => ExportDialog(model: model),
                                );
                            },
                            child: Text("Export!"),
                          )
                        ],
                      )
                    : RaisedButton(
                        onPressed: () =>
                          model.startExport(),
                        child: Text("Export your databse"),
                      ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("Import a new database from a CSV"),
                )
              ],
            ),
          ),
    );
  }
}
