import 'package:flutter/material.dart';
import 'package:recipe/data/models/user.dart';
import '../../util/enums/category.dart';
import '../../util/abstracts/mappable.dart';
import '../../util/extensions/common.dart';

class Dish extends Mappable {
  final int id;
  final String name;
  final String image;
  final String ingredients;
  final String description;
  final DishCategory dishCategory;
  final DateTime createdAt;
  final int userId;
  final User user;

  Dish({
    this.id,
    @required this.name,
    @required this.image,
    @required this.ingredients,
    @required this.description,
    @required this.dishCategory,
    this.createdAt,
    @required this.userId,
    this.user,
  });

  factory Dish.fromJson(Map map) {
    return Dish(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      ingredients: map['ingredients'],
      description: map['description'],
      dishCategory: (map['dish_category'] as String).getCategory(),
      createdAt: DateTime.parse(map['created_at']),
      userId: map['user_Id'],
      user: User.fromJson(map['user']),
    );
  }

  @override
  Map toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'ingredients': ingredients,
      'description': description,
      'dish_category': dishCategory.getString(),
      'user_id': userId,
    };
  }
}
