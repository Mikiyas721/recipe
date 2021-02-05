import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/dish.dart';
import '../../util/apiQuery.dart';
import '../../util/enums/category.dart';
import '../../util/preferenceKeys.dart';
import '../../util/abstracts/disposable.dart';

class DishBloc extends Disposable {
  final _latest =
      GetIt.instance.get<BehaviorSubject<List>>(instanceName: 'Latest');
  final _myDishes =
      GetIt.instance.get<BehaviorSubject<List>>(instanceName: 'MyDishes');
  final _breakfast =
      GetIt.instance.get<BehaviorSubject<List>>(instanceName: 'Breakfast');
  final _lunch =
      GetIt.instance.get<BehaviorSubject<List>>(instanceName: 'Lunch');
  final _drinks =
      GetIt.instance.get<BehaviorSubject<List>>(instanceName: 'Drinks');
  final _appetizers =
      GetIt.instance.get<BehaviorSubject<List>>(instanceName: 'Appetizers');
  final _soups =
      GetIt.instance.get<BehaviorSubject<List>>(instanceName: 'Soups');
  final _vegetarian =
      GetIt.instance.get<BehaviorSubject<List>>(instanceName: 'Vegetarian');
  final _desserts =
      GetIt.instance.get<BehaviorSubject<List>>(instanceName: 'Desserts');

  final _name =
      GetIt.instance.get<BehaviorSubject<String>>(instanceName: 'DishName');
  final _ingredients =
      GetIt.instance.get<BehaviorSubject<String>>(instanceName: 'Ingredients');
  final _description =
      GetIt.instance.get<BehaviorSubject<String>>(instanceName: 'Description');
  final _dishCategory = GetIt.instance
      .get<BehaviorSubject<DishCategory>>(instanceName: 'DishCategory');

  final _api = GetIt.instance.get<ApiQuery>();
  final _preference = GetIt.instance.get<SharedPreferences>();

  Stream<List> get latestStream => _latest.map((value) => value);

  Stream<List> get myDishesStream => _myDishes.map((value) => value);

  Stream<List> get breakfastStream => _breakfast.map((value) => value);

  Stream<List> get lunchStream => _lunch.map((value) => value);

  Stream<List> get drinksStream => _drinks.map((value) => value);

  Stream<List> get appetizersStream => _appetizers.map((value) => value);

  Stream<List> get soupsStream => _soups.map((value) => value);

  Stream<List> get vegetarianStream => _vegetarian.map((value) => value);

  Stream<List> get dessertsStream => _desserts.map((value) => value);

  void onName(String value) {
    _name.add(value);
  }

  void onIngredients(String value) {
    _ingredients.add(value);
  }

  void onDescription(String value) {
    _description.add(value);
  }

  void onDishCategory(DishCategory value) {
    _dishCategory.add(value);
  }

  void loadLatest() async {
    _latest.add((await _api.getLatestDishes()).data['dishes']);
  }

  void loadMyDishes() async {
    _myDishes.add((await _api
            .getDishesForUser(_preference.getInt(PreferenceKeys.userIdKey)))
        .data['dishes']);
  }

  void loadBreakfast() async {
    _breakfast.add(
        (await _api.getDishByCategory(DishCategory.BREAKFAST)).data['dishes']);
  }

  void loadLunch() async {
    _lunch
        .add((await _api.getDishByCategory(DishCategory.LUNCH)).data['dishes']);
  }

  void loadDrinks() async {
    _drinks.add(
        (await _api.getDishByCategory(DishCategory.DRINKS)).data['dishes']);
  }

  void loadAppetizers() async {
    _appetizers.add(
        (await _api.getDishByCategory(DishCategory.APPETIZERS)).data['dishes']);
  }

  void loadSoups() async {
    _soups
        .add((await _api.getDishByCategory(DishCategory.SOUPS)).data['dishes']);
  }

  void loadVegetarian() async {
    _vegetarian.add(
        (await _api.getDishByCategory(DishCategory.VEGETARIAN)).data['dishes']);
  }

  void loadDesserts() async {
    _desserts.add(
        (await _api.getDishByCategory(DishCategory.DESSERTS)).data['dishes']);
  }

  Future<bool> addDish() async {
    return !(await _api.addDish(
      Dish(
          name: _name.value,
          ingredients: _ingredients.value,
          description: _description.value,
          dishCategory: _dishCategory.value,
          userId: _preference.getInt(PreferenceKeys.userIdKey)),
    ))
        .hasException;
  }

  @override
  void dispose() {
    _latest.close();
    _myDishes.close();
    _breakfast.close();
    _lunch.close();
    _drinks.close();
    _appetizers.close();
    _soups.close();
    _vegetarian.close();
    _desserts.close();

    _name.close();
    _ingredients.close();
    _description.close();
    _dishCategory.close();
  }
}
