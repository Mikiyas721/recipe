import 'dart:convert';

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
          bloc.loadLatest();
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 300,
              elevation: 0,
              flexibleSpace: Stack(
                children: [
                  StreamBuilder(
                      stream: bloc.latestStream,
                      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                        return snapshot.data == null
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : snapshot.data.isEmpty
                                ? Container()
                                : CarouselSlider(
                                    options: CarouselOptions(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.34,
                                        viewportFraction: 1,
                                        autoPlay: true,
                                        autoPlayInterval: Duration(seconds: 5)),
                                    items: snapshot.data.map((map){
                                      return Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: MemoryImage(base64.decode(map['image'])
                                            ),
                                                fit: BoxFit.fill)),
                                      );
                                    }).toList()
                                  );
                      }),
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
                              'Latest Dishes',
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
            body: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: DishList(
                  noDataMessage: 'No recent dish', stream: bloc.latestStream),
            ),
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
