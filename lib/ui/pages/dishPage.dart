import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:recipe/data/models/dish.dart';
import '../../util/extensions/common.dart';

class DishPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dish dish = ModalRoute.of(context).settings.arguments;
    Uint8List bytes =  base64.decode(dish.image);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: MemoryImage(bytes), fit: BoxFit.cover)),
          ),
          DraggableScrollableSheet(
              minChildSize: 0.5,
              maxChildSize: 0.8,
              initialChildSize: 0.5,
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
