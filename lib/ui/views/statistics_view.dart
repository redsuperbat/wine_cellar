import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/views/statistics_model.dart';

import 'base_widget.dart';
import 'widgets/statistics_view/pie_chart_page_view.dart';
import 'widgets/statistics_view/top_card.dart';

class StatisticsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<StatisticsModel>(
      model: StatisticsModel(
        db: Provider.of(context),
        settings: Provider.of(context),
      ),
      onModelReady: (model) async => await model.loadAllStatistics(),
      builder: (context, model, child) => WillPopScope(
            onWillPop: () async => false,
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
              body: model.busy
                  ? Container()
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TopCard(model: model),
                          PieChartPageView(model: model),
                        ],
                      ),
                    ),
            ),
          ),
    );
  }
}
