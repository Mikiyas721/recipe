import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../../data/models/dish.dart';
import '../../util/extensions/common.dart';

class DishCard extends StatelessWidget {
  final Dish dish;

  const DishCard({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uint8List bytes =  base64.decode(dish.image);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/dishPage',arguments: dish);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: MemoryImage(bytes), fit: BoxFit.fill),
            border: Border.all(width: 0.2, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top:10,right: 10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/4.jpg'),
                  ),
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(left: 10,bottom: 10),
                padding: 4.allPadding,
                decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${dish.name}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '${dish.dishCategory.getString()}',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
