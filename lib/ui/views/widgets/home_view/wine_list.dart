import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/widgets/wine_list_model.dart';

import '../../base_widget.dart';
import 'wine_card.dart';

class WineList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<WineListModel>(
      model: WineListModel(wineService: Provider.of(context)),
      builder: (context, model, child) => model.busy
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Expanded(
        child: RefreshIndicator(
          onRefresh: () async => await model.onRefresh(),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: model.wines.length,
            itemBuilder: (context, index) =>
                WineCard(wine: model.wines[index], model: model),
            //WineCard(wine: model.wines[index]),
          ),
        ),
      ),
    );
  }
}
