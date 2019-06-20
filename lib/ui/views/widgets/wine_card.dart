import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter/material.dart';
import 'package:wine_cellar/core/models/wine.dart';
import 'package:wine_cellar/core/viewmodels/home_model.dart';
import 'package:wine_cellar/core/viewmodels/search_model.dart';

import 'wine_slider.dart';

class WineCard extends StatelessWidget {
  final Wine wine;
  final HomeModel homeModel;
  final SearchModel searchModel;

  WineCard({this.wine, this.homeModel, this.searchModel});

  @override
  Widget build(BuildContext context) {
    print(wine.image.toString());
    return Slidable(
      key: ValueKey(wine.id),
      secondaryActions: <Widget>[
        SlideAction(
          child: WineSlider(
            title: 'Remove all',
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            color: Colors.red[300],
          ),
          onTap: () => homeModel == null
              ? searchModel.removeWine(wine)
              : homeModel.removeWine(wine),
        ),
        SlideAction(
          child: WineSlider(
            title: "Drink one",
            color: Colors.blue[300],
            child: Icon(
              Icons.delete_sweep,
              color: Colors.white,
            ),
          ),
          onTap: () => homeModel == null
              ? searchModel.decrementWine(wine)
              : homeModel.decrementWine(wine),
        )
      ],
      actionPane: SlidableScrollActionPane(),
      child: Card(
        child: InkWell(
          onTap: () {
            homeModel == null
                ? searchModel.injectWine(wine)
                : homeModel.injectWine(wine);
            Navigator.pushNamed(context, 'wine');
          },
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(8),
                child: Image.asset(
                  wine.type == null
                      ? 'assets/wine_placeholder.png'
                      : wine.type == "Rosé"
                          ? 'assets/wines/rose_wine.png'
                          : wine.type == "Red"
                              ? 'assets/wines/red_wine.png'
                              : 'assets/wines/white_wine.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      wine.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(wine.location),
                  Text(
                    wine.grapes,
                    style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      wine.vintage,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  Container(
                    height: 15,
                    child: Text(wine.size),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      '${wine.owned} st',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ),
                  Container(
                    child: Text(wine.time.substring(0, 10)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
