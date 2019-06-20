import 'package:flutter/material.dart';
import 'package:wine_cellar/core/enums/viewstate.dart';
import 'package:wine_cellar/core/viewmodels/home_model.dart';

import 'base_view.dart';
import 'widgets/filter_drawer.dart';
import 'widgets/wine_card.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.loadMockData(),
      builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("Your Wines"),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => Navigator.pushNamed(context, 'search'),
                ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {},
                ),
              ],
              leading: Builder(
                builder: (context) => IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
              ),
            ),
            drawer: FilterDrawer(model: model),
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
