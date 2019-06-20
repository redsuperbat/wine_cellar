import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/add_model.dart';

class WineImage extends StatelessWidget {
  final AddModel model;

  const WineImage({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model.image != null
        ? Image.file(
            model.image,
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          )
        : Container(
            width: 100,
            height: 100,
            child: InkWell(
              onTap: () {
                model.getImage();
              },
              child: FittedBox(
                fit: BoxFit.cover,
                child: Icon(
                  Icons.add_a_photo,
                ),
              ),
            ),
          );
  }
}
