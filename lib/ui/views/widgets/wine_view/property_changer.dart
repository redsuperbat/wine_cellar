import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PropertyChanger extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final List<TextInputFormatter> inputFormatters;

  PropertyChanger(
      {this.title, this.controller, this.keyBoardType, this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, top: 8),
          child: Text(title),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            keyboardType: keyBoardType,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(border: InputBorder.none),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
