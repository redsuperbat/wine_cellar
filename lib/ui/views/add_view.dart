import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/views/add_model.dart';

import 'base_widget.dart';
import 'widgets/add_view/bottle_amount.dart';
import 'widgets/add_view/country_picker.dart';
import 'widgets/add_view/picker.dart';
import 'widgets/add_view/vintage_picker.dart';
import 'widgets/add_view/wine_form.dart';

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AddModel>(
      model: AddModel(
        wineService: Provider.of(context),
      ),
      builder: (context, model, child) => Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.05, 0.1],
                tileMode: TileMode.clamp,
                colors: [
                  Colors.red[400],
                  Colors.blue[100],
                ],
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/')),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.add_a_photo,
                  color: Colors.white,
                ),
                onPressed: () async => await model.getImage(),
              ),
              body: WillPopScope(
                onWillPop: () async => false,
                child: SingleChildScrollView(
                  child: Card(
                    margin: EdgeInsets.all(25),
                    elevation: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Add more wine to your cellar",
                          style: TextStyle(fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        model.image == null
                            ? Container()
                            : Image.file(
                                model.image,
                                fit: BoxFit.contain,
                                height: 100,
                              ),
                        AddWineForm(),
                        SizedBox(
                          height: 15,
                        ),
                        Picker(),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: <Widget>[
                            Spacer(),
                            CountryPicker(),
                            Spacer(),
                            BottleAmount(),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: VintagePicker(),
                        ),
                        RaisedButton(
                          onPressed: () async {
                            await model.addWineToDb();
                            Navigator.pushReplacementNamed(context, '/');
                          },
                          child: Text("Add to Cellar"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
