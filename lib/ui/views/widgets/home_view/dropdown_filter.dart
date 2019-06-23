import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/widgets/dropdown_filter_model.dart';

import '../../base_widget.dart';


class DropdownFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<DropdownFilterModel>(
      model: DropdownFilterModel(),
      builder: (context, model, child) => Container(
        margin: EdgeInsets.only(top: 3),
        child: PopupMenuButton(
          icon: Icon(Icons.filter_list),
          itemBuilder: (context) {
        /*    model.category
                .map(
                  (f) => PopupMenuItem<String>(
                value: model.type,
                child: Container(
                  child: InkWell(
                    onTap: () => showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                            200, 50, 50, 400),
                        items: model.subCategory[model.index]
                            .map((s) {
                          print("Im doing stuff");
                          PopupMenuItem<String>(
                              child: Text(s));})
                            .toList()),
                    child: Container(),
                  ),
                ),
              ),
            )
                .toList();
            model.index++;*/
          },
        ),
      ),
    );
  }
}
