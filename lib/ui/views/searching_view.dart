import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wine_cellar/core/viewmodels/views/search_model.dart';


import 'base_widget.dart';
import 'widgets/home_view/wine_list.dart';

class SearchView extends StatelessWidget {
  final TextStyle style = TextStyle(
    color: Color(0xFF373F51),
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SearchModel>(
      model: SearchModel(wineService: Provider.of(context)),
      builder: (context, model, child) => WillPopScope(
            onWillPop: () => model.getAllWine(),
            child: Scaffold(
              appBar: AppBar(
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (query) => model.search(query),
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                            hintText: "Search", border: InputBorder.none),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    color: Colors.black87,
                    height: 2,
                    width: MediaQuery.of(context).size.width,
                  ),
                  WineList(),
                ],
              ),
            ),
          ),
    );
  }
}
