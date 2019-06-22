import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wine_cellar/core/viewmodels/views/add_model.dart';

class WineForm extends StatelessWidget {
  final AddModel model;

  WineForm({this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Column(
        children: <Widget>[
          TextField(
            controller: model.nameProdCont,
            decoration: InputDecoration(hintText: 'Brand Name & Wine Producer'),
          ),
          TextField(
            controller: model.grapeCont,
            decoration: InputDecoration(hintText: 'Grapes'),
          ),
          TextField(
            controller: model.aooCont,
            decoration: InputDecoration(
              suffixIcon: Tooltip(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  message:
                      'Where the wine originates from. \nEg. Bourgogne, Bourdeaux or Napa-Valley',
                  child: Icon(
                    Icons.info,
                  )),
              hintText: 'Appellation of origin',
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              // WhitelistingTextInputFormatter('[0-9.]'), Implement me
            ],
            controller: model.priceCont,
            decoration: InputDecoration(hintText: 'Purchase price'),
          ),
        ],
      ),
    );
  }
}
