import 'package:flutter/material.dart';


class Dot extends StatelessWidget {
  final double dimensions;
  final Color color;

  Dot({this.dimensions, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: dimensions,
      width: dimensions,
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(dimensions*0.5)
      ),
    );
  }
}
