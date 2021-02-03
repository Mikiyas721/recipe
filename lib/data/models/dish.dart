import 'package:flutter/material.dart';
import '../../util/abstracts/mappable.dart';

class Dish extends Mappable {
  final int id;
  final String name;
  final String ingredients;
  final String description;
  final int userId;

  Dish({
    this.id,
    @required this.name,
    @required this.ingredients,
    @required this.description,
    @required this.userId,
  });

  factory Dish.fromJson(Map map){
    return Dish(
      id: map['id'],
      name: map['name'],
      ingredients: map['ingredients'],
      description: map['description'],
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
      'user_id': userId,
    };
  }
}
