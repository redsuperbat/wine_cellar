import 'package:flutter/material.dart';
import 'package:wine_cellar/core/viewmodels/widgets/country_picker_model.dart';

class CountryDialog extends StatelessWidget {
  final CountryPickerModel model;

  CountryDialog({this.model});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.transparent,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: 200,
          child: ListView.builder(
            physics: ScrollPhysics(),
            itemCount: model.countries.length,
            itemBuilder: (context, index) => Material(
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        model.setCountry(index);
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            model.countries[index].flag,
                            height: 40,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            model.countries[index].name,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
