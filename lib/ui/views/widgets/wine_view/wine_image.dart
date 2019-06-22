import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/views/wine_model.dart';

class WineImage extends StatelessWidget {
  final WineModel model;

  const WineImage({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => showDialog(
              context: context,
              builder: (_) => Dialog(
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.file(
                        model.image,
                      ),
                    ),
                  ),
            ),
        child: model.image == null
            ? Container()
            : Container(
                margin:
                    EdgeInsets.only(top: 15, right: 15, left: 40, bottom: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    model.image,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
      ),
    );
  }
}
