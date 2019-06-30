import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomPieChart extends StatelessWidget {
  final Map<String, double> dataMap;
  final int numberOfWines;
  final bool busy;
  final String title;

  CustomPieChart(
      {      @required this.dataMap,
      @required this.title,
      @required this.numberOfWines,
      @required this.busy});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: busy || numberOfWines == 0
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Center(child: Text("You have no wines :(")),
            )
          : Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                PieChart(
                  legendFontWeight: FontWeight.normal,
                  chartRadius: MediaQuery.of(context).size.width * 0.35,
                  dataMap: dataMap,
                ),
              ],
            ),
    );
  }
}
