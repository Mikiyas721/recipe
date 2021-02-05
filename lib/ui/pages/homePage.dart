import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../data/bloc/dishBloc.dart';
import '../../data/bloc/provider.dart';
import '../../ui/widgets/dishList.dart';
import '../../ui/widgets/navButton.dart';
import '../../util/extensions/common.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: DishBloc(),
        builder: (BuildContext context, DishBloc bloc) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 340,
              elevation: 0,
              flexibleSpace: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.4,
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 5)),
                    items: [
                      'assets/1.jpg',
                      'assets/2.jpg',
                      'assets/3.jpg',
                      'assets/4.jpg',
                    ]
                        .map((String url) => Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(url),
                                      fit: BoxFit.fill)),
                            ))
                        .toList(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 75,
                      decoration: BoxDecoration(
                          color: context.primaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Row(
                        children: [
                          Padding(
                            padding: 20.hPadding,
                            child: Text(
                              'Latest Recipes',
                              style: context.headline2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: DishList(
                noDataMessage: 'No recent dish', stream: bloc.latestStream),
            bottomSheet: Container(
              color: context.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavButton(
                    icon: Icons.home,
                    label: 'Home',
                    onTap: () {},
                  ),
                  NavButton(
                    icon: Icons.category,
                    label: 'Category',
                    onTap: () {
                      Navigator.pushNamed(context, '/categoryPage');
                    },
                  ),
                  NavButton(
                    icon: Icons.add_circle_outline,
                    label: 'Add',
                    onTap: () {
                      Navigator.pushNamed(context, '/dishAddingPage');
                    },
                  ),
                  NavButton(
                    icon: Icons.search,
                    label: 'Search',
                    onTap: () {
                      Navigator.pushNamed(context, '/searchPage');
                    },
                  ),
                  NavButton(
                    icon: Icons.person,
                    label: 'Person',
                    onTap: () {
                      Navigator.pushNamed(context, '/profilePage');
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
