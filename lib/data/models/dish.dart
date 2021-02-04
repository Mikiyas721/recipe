import 'package:flutter/material.dart';
import '../../util/enums/category.dart';
import '../../util/abstracts/mappable.dart';
import '../../util/extensions/common.dart';

class Dish extends Mappable {
  final int id;
  final String name;
  final String ingredients;
  final String description;
  final DishCategory dishCategory;
  final int userId;

  Dish({
    this.id,
    @required this.name,
    @required this.ingredients,
    @required this.description,
    @required this.dishCategory,
    @required this.userId,
  });

  factory Dish.fromJson(Map map){
    return Dish(
      id: map['id'],
      name: map['name'],
      ingredients: map['ingredients'],
      description: map['description'],
      dishCategory: map['dish_category'].getCategory(),
      userId: map['user_id'],
    );
  }

  @override
  Map toMap() {
    return {
      'id': id,
      'name': name,
      'ingredients': ingredients,
      'description': description,
      'dish_category':dishCategory.getString(),
      'user_id': userId,
    };
  }
}
