import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/views/export_model.dart';

class ExportDialog extends StatelessWidget {
  final ExportModel model;

  ExportDialog({this.model});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Filename cannot be ${model.text}"),
      content: RaisedButton(
        onPressed: () {
          model.resolveError();
          model.startExport();
          Navigator.pop(context);
        },
        child: Text("Return"),
      ),
    );
  }
}
