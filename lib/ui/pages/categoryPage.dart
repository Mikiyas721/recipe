import 'package:flutter/material.dart';
import '../../util/extensions/common.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Recipes',style: context.headline2,),
          bottom: TabBar(
              labelPadding: 10.allPadding,
              isScrollable: true,
              tabs: ['Breakfast', 'Lunch', 'Beverages', 'Appetizers', 'Soups','Breakfast', 'Lunch', 'Beverages', 'Appetizers', 'Soups',]
                  .map((e) => Text(
                        e,
                        style: context.bodyText2,
                      ))
                  .toList()),
        ),
        body: TabBarView(
            children: ['Breakfast', 'Lunch', 'Beverages', 'Appetizers', 'Soups','Breakfast', 'Lunch', 'Beverages', 'Appetizers', 'Soups',]
                .map((e) => Center(child: Text(e,style: context.headline1,)))
                .toList()),
      ),
    );
  }
}
