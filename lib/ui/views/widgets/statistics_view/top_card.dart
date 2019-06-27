import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/views/statistics_model.dart';

class TopCard extends StatelessWidget {
  final StatisticsModel model;

  TopCard({this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.red[800],
                    Colors.red[600],
                    Colors.red[500],
                    Colors.red
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "Cellar statistics",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      TopCardCircles(
                        top: Image.asset(
                          'assets/wines/wine_bottle_icon.png',
                          width: 30,
                          height: 30,
                        ),
                        middle: model.totalWines > 999999
                            ? (model.totalWines / 1000000).toStringAsFixed(1) +
                                'M'
                            : model.totalWines > 99999
                                ? (model.totalWines / 1000).toStringAsFixed(0) +
                                    'K'
                                : model.totalWines > 999
                                    ? (model.totalWines / 1000)
                                            .toStringAsFixed(1) +
                                        'K'
                                    : '${model.totalWines}',
                        bottom: "Wines in\ncellar",
                      ),
                      TopCardCircles(
                        top: Icon(
                          Icons.monetization_on,
                          color: Colors.white,
                          size: 30,
                        ),
                        middle: model.cellarWorth > 999999
                            ? (model.cellarWorth / 1000000).toStringAsFixed(1) +
                                'M'
                            : model.cellarWorth > 99999
                                ? (model.cellarWorth / 1000).toStringAsFixed(0) +
                                    'K'
                                : model.cellarWorth > 999
                                    ? (model.cellarWorth / 1000)
                                            .toStringAsFixed(1) +
                                        'K'
                                    : '${model.cellarWorth}',
                        bottom: "Cellar net\nworth",
                        extra: model.currency,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.red[400],
                    Colors.red[300],
                    Colors.red[200],
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TopCardCircles extends StatelessWidget {
  final Widget top;
  final String middle;
  final String extra;
  final String bottom;

  TopCardCircles({this.top, this.middle, this.bottom, this.extra});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(150),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: top,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: EdgeInsets.only(left: 18),
                        child: Text(
                          middle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        extra ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Text(
                  bottom,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
