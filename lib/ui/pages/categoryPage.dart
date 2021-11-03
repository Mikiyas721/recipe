import 'package:flutter/material.dart';
import '../../ui/widgets/dishList.dart';
import '../../data/bloc/dishBloc.dart';
import '../../data/bloc/provider.dart';
import '../../util/extensions/common.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController;

    return BlocProvider(
        bloc: DishBloc(context),
        onInit: (DishBloc bloc) {
          tabController = TabController(length: 7, vsync: this);
          tabController.addListener(() {
            if (tabController.index == 0)
              bloc.loadBreakfast();
            else if (tabController.index == 1)
              bloc.loadLunch();
            else if (tabController.index == 2)
              bloc.loadDrinks();
            else if (tabController.index == 3)
              bloc.loadAppetizers();
            else if (tabController.index == 4)
              bloc.loadSoups();
            else if (tabController.index == 5)
              bloc.loadVegetarian();
            else if (tabController.index == 6) bloc.loadDesserts();
          });
          bloc.loadBreakfast();
        },
        builder: (BuildContext context, DishBloc bloc) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Dishes',
                style: context.headline2,
              ),
              bottom: TabBar(
                  controller: tabController,
                  labelPadding: 10.allPadding,
                  isScrollable: true,
                  tabs: [
                    'Breakfast',
                    'Lunch',
                    'Drinks',
                    'Appetizers',
                    'Soups',
                    'Vegetarian',
                    'Desserts',
                  ]
                      .map((e) => Text(
                            e,
                            style: context.bodyText2,
                          ))
                      .toList()),
            ),
            body: TabBarView(controller: tabController, children: [
              DishList(
                  noDataMessage: 'No dish with category Breakfast',
                  stream: bloc.breakfastStream),
              DishList(
                  noDataMessage: 'No dish with category Lunch',
                  stream: bloc.lunchStream),
              DishList(
                  noDataMessage: 'No dish with category Drinks',
                  stream: bloc.drinksStream),
              DishList(
                  noDataMessage: 'No dish with category Appetizers',
                  stream: bloc.appetizersStream),
              DishList(
                  noDataMessage: 'No dish with category Soups',
                  stream: bloc.soupsStream),
              DishList(
                  noDataMessage: 'No dish with category Vegetarian',
                  stream: bloc.vegetarianStream),
              DishList(
                  noDataMessage: 'No dish with category Desserts',
                  stream: bloc.dessertsStream),
            ]),
          );
        });
  }
}
