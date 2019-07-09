import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/views/wine_edit_model.dart';

import 'base_widget.dart';


class WineEditView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<WineEditModel>(
      model: WineEditModel(),
      builder: (context,model,child) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            
          ],
        ),
      ),
    );
  }
}
