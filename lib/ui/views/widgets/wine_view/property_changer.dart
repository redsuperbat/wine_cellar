import 'package:flutter/material.dart';

class PropertyChanger extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  PropertyChanger({this.title, this.controller});

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
            decoration: InputDecoration(border: InputBorder.none),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
