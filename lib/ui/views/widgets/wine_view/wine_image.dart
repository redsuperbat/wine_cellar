import 'dart:io';

import 'package:flutter/material.dart';

class WineImage extends StatelessWidget {
  final String path;
  final double width;
  final double height;

  const WineImage({Key key, this.path, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(path);
    final image = path == null ? null : File(path);
    return Hero(
      tag: "image",
      child: image == null
          ? Container(
              child: Center(
                child: Text("No image"),
              ),
            )
          : GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'image', arguments: path),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  image,
                  fit: BoxFit.contain,
                  height: height,
                  width: width,
                ),
              ),
            ),
    );
  }
}
