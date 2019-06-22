import 'package:flutter/material.dart';
import 'package:wine_cellar/core/enums/viewstate.dart';
import 'package:wine_cellar/core/viewmodels/home_model.dart';

import 'base_view.dart';
import 'widgets/home_view/drawer.dart';
import 'package:wine_cellar/ui/views/widgets/home_view/wine_card.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) {
        model.loadDbData();
        model.loadAssets();
      },
      builder: (context, model, child) => model.state == ViewState.Busy
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
                    model.state == ViewState.Busy
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: model.wines.length,
                              itemBuilder: (context, index) => WineCard(
                                    wine: model.wines[index],
                                    homeModel: model,
                                  ),
                              //WineCard(wine: model.wines[index]),
                            ),
                          ),
                  ],
                ),
              ),
            ),
    );
  }
}
