import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/views/statistics_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'base_widget.dart';
import 'widgets/statistics_view/custom_pie_chart.dart';
import 'widgets/statistics_view/top_card.dart';

class StatisticsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<StatisticsModel>(
      model: StatisticsModel(db: Provider.of(context)),
      onModelReady: (model) async => await model.loadAllStatistics(),
      builder: (context, model, child) => WillPopScope(
            onWillPop: () =>
                Navigator.pushReplacementNamed(context, '/', result: true),
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                ),
                title: Text(
                  "Statistics",
                  textAlign: TextAlign.center,
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TopCard(model: model),
                    CustomPieChart(
                      dataMap: model.typeStats,
                      busy: model.busy,
                      numberOfWines: model.totalWines,
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
