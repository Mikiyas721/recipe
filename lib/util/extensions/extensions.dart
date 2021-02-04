import 'package:flutter/material.dart';
import '../../util/enums/category.dart';

extension BuildContextExtension on BuildContext {
  TextStyle get headline1 => Theme.of(this).textTheme.headline1;

  TextStyle get headline2 => Theme.of(this).textTheme.headline2;

  TextStyle get headline3 => Theme.of(this).textTheme.headline3;

  TextStyle get subtitle2 => Theme.of(this).textTheme.subtitle2;

  TextStyle get bodyText2 => Theme.of(this).textTheme.bodyText2;

  TextStyle get bodyText1 => Theme.of(this).textTheme.bodyText1;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get iconColor => Theme.of(this).iconTheme.color;
}

extension SpacingExtension on num {
  SizedBox get vSpace => SizedBox(height: this.toDouble());

  SizedBox get hSpace => SizedBox(width: this.toDouble());

  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: this.toDouble());

  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: this.toDouble());

  EdgeInsets get allPadding => EdgeInsets.all(this.toDouble());
}

extension StringExtension on String {
  DishCategory getCategory() {
    if (this == 'Breakfast')
      return DishCategory.BREAKFAST;
    else if (this == 'Lunch')
      return DishCategory.LUNCH;
    else if (this == 'Drinks')
      return DishCategory.DRINKS;
    else if (this == 'Appetizers')
      return DishCategory.APPETIZERS;
    else if (this == 'Soups')
      return DishCategory.SOUPS;
    else if (this == 'Vegetarian')
      return DishCategory.VEGETARIAN;
    else if (this == 'Desserts')
      return DishCategory.DESSERTS;
    else
      throw Exception("Couldn't map Category to string");
  }
}

extension CategoryExtension on DishCategory {
  String getString() {
    switch (this) {
      case DishCategory.BREAKFAST:
        return 'Breakfast';
        break;
      case DishCategory.LUNCH:
        return 'Lunch';
        break;
      case DishCategory.DRINKS:
        return 'Drinks';
        break;
      case DishCategory.APPETIZERS:
        return 'Appetizers';
        break;
      case DishCategory.SOUPS:
        return 'Soups';
        break;
      case DishCategory.VEGETARIAN:
        return 'Vegetarian';
        break;
      case DishCategory.DESSERTS:
        return 'Desserts';
        break;
      default:
        throw Exception('Unable to map category to String');
    }
  }
}
