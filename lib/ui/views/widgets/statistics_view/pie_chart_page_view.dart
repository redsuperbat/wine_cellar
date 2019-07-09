import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/views/statistics_model.dart';

import 'custom_pie_chart.dart';
import 'dot.dart';

class PieChartPageView extends StatelessWidget {
  final StatisticsModel model;

  PieChartPageView({this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 6, right: 6, left: 6),
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: PageView(
              onPageChanged: (index) => model.setIndex(index),
              controller: model.controller,
              children: <Widget>[
                CustomPieChart(
                    title: "Bottle sizes",
                    dataMap: model.stats[1],
                    numberOfWines: model.totalWines,
                    busy: model.busy),
                CustomPieChart(
                  title: "Categories",
                  busy: model.busy,
                  dataMap: model.stats[0],
                  numberOfWines: model.totalWines,
                ),
                CustomPieChart(
                    title: "Countries",
                    dataMap: model.stats[2],
                    numberOfWines: model.totalWines,
                    busy: model.busy)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (var i = 0; i < model.stats.length; i++)
                Dot(
                  dimensions: model.index == i ? 13 : 10,
                  color: model.index == i ? Colors.red : null,
                )
            ],
          )
        ],
      ),
    );
  }
}
