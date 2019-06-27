import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomPieChart extends StatelessWidget {
  final Map<String, double> dataMap;
  final int numberOfWines;
  final bool busy;

  CustomPieChart(
      {@required this.dataMap,
      @required this.numberOfWines,
      @required this.busy});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: busy || numberOfWines == 0
            ? Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 200,
                child: Center(child: Text("You have no wines :(")),
              )
            : Row(
                children: [
                  PieChart(
                    legendFontWeight: FontWeight.normal,
                    chartRadius: MediaQuery.of(context).size.width * 0.35,
                    dataMap: dataMap,
                  ),
                  Expanded(
                    child: Center(
                      child: Text("this is a textbit"),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
