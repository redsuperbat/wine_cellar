import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/views/add_model.dart';
import 'package:wine_cellar/core/viewmodels/widgets/bottle_amount_model.dart';

import '../../base_widget.dart';

class BottleAmount extends StatefulWidget {
  @override
  _BottleAmountState createState() => _BottleAmountState();
}

class _BottleAmountState extends State<BottleAmount> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<BottleAmountModel>(
      model: BottleAmountModel(wineService: Provider.of(context)),
      builder: (context, model, child) => Column(
            children: <Widget>[
              Text("Amount of bottles"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    child: InkWell(
                      child: Icon(
                        Icons.remove,
                        size: 50,
                      ),
                      onTap: () => model.decrement(),
                    ),
                  ),
                  Container(
                    width: 30,
                    child: TextField(
                      inputFormatters: <TextInputFormatter>[
                        BlacklistingTextInputFormatter('-',
                            replacementString: '')
                      ],
                      maxLength: 3,
                      controller: model.controller,
                      keyboardType: TextInputType.numberWithOptions(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      child: Icon(
                        Icons.add,
                        size: 50,
                      ),
                      onTap: () => model.increment(),
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }
}
