import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/views/home_model.dart';

import 'base_widget.dart';
import 'widgets/home_view/drawer.dart';
import 'widgets/home_view/wine_list.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeModel>(
      model: HomeModel(
        wineService: Provider.of(context),
        json: Provider.of(context),
      ),
      onModelReady: (model) {
        model.loadDbData();
        model.loadAssets();
      },
      builder: (context, model, child) => model.busy
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                title: Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Your Wines"),
                      Text(
                        model.subtitle,
                        style: TextStyle(
                            fontSize: 15, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ),
                actions: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    child: PopupMenuButton(
                      icon: Icon(Icons.filter_list),
                      onSelected: (value) => model.filterWines(value),
                      itemBuilder: (context) => model.filter
                          .map((f) => PopupMenuItem<String>(
                                value: f,
                                child: Text(f),
                              ))
                          .toList(),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => Navigator.pushNamed(context, 'search'),
                  ),
                ],
                leading: Builder(
                  builder: (context) => IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                ),
              ),
              drawer: MyDrawer(model: model),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () => Navigator.pushNamed(context, 'add'),
                child: Icon(Icons.add),
              ),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: <Widget>[
                    Text(
                      "The latest additions to the cellar",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    WineList(),
                  ],
                ),
              ),
            ),
    );
  }
}
