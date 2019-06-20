import 'package:flutter/material.dart';
import 'package:wine_cellar/core/enums/viewstate.dart';
import 'package:wine_cellar/core/viewmodels/search_model.dart';

import 'base_view.dart';
import 'package:wine_cellar/ui/views/widgets/home_view/wine_card.dart';

class SearchView extends StatelessWidget {
  final TextStyle style = TextStyle(
    color: Color(0xFF373F51),
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchModel>(
      builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                          hintText: "Search", border: InputBorder.none),
                      controller: model.controller,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => model.controller.clear(),
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
                model.state == ViewState.Busy
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: ListView.builder(
                                itemCount: model.wines.length,
                                itemBuilder: (context, index) => WineCard(
                                      wine: model.wines[index],
                                      searchModel: model,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
    );
  }
}
