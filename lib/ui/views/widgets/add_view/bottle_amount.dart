import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wine_cellar/core/viewmodels/add_model.dart';

class BottleAmount extends StatelessWidget {
  final AddModel model;

  BottleAmount({this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  BlacklistingTextInputFormatter('-', replacementString: '')
                ],
                maxLength: 3,
                controller: model.counterCont,
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
    );
  }
}
