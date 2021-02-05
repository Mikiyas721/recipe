import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipe/data/models/dish.dart';
import '../../util/extensions/common.dart';

class DishPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dish dish = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.43,
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
                              image: AssetImage(url), fit: BoxFit.fill)),
                    ))
                .toList(),
          ),
          DraggableScrollableSheet(
              minChildSize: 0.6,
              maxChildSize: 0.8,
              initialChildSize: 0.6,
              builder: (BuildContext context, ScrollController controller) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      border: Border.all(color: Colors.black12, width: 0.4)),
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Padding(
                      padding: 20.hPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.vSpace,
                          Center(
                              child: Text(
                                  '${dish.name} - ${dish.dishCategory.getString()}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20))),
                          20.vSpace,
                          Text('Ingredients',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20)),
                          10.vSpace,
                          Text(dish.ingredients,
                              maxLines: 20,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                          20.vSpace,
                          Text('Description',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20)),
                          10.vSpace,
                          Text(dish.description,
                              maxLines: 20,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),

                          30.vSpace,
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(radius: 60
                                ),
                                10.vSpace,
                                Text(
                                  dish.user.name,
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                                Text(
                                  dish.user.email,
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                                Text(
                                  dish.user.phoneNumber,
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          Positioned(
              left: 20,
              top: 60,
              child: Container(
                padding: 10.allPadding,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
