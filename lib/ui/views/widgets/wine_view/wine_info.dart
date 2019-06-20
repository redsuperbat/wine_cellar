import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/wine_model.dart';


class WineInfo extends StatelessWidget {
  final WineModel model;
  final double fontSize = 25;
  final File image;

  const WineInfo({Key key, this.model, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: image == null
                ? Image.asset(
              'assets/wine_placeholder.png',
              height: 200,
              fit: BoxFit.contain,
            )
                : Image.file(
              image,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                model.wine.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                  text: model.wine.country == ""
                      ? ""
                      : '${model.wine.country}, ',
                  children: <TextSpan>[
                    TextSpan(text: model.wine.aoo ?? ""),
                  ],
                ),
              ),
              Text(
                model.wine.vintage,
                style: TextStyle(fontSize: fontSize),
              ),
              Text(
                model.wine.size,
                style: TextStyle(fontSize: fontSize),
              ),
              Text(
                '${model.wine.owned} pc',
                style: TextStyle(fontSize: fontSize),
              ),
              Text(
                'Put in cellar: ${model.wine.time.substring(0, 16)}',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
