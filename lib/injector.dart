import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './util/apiQuery.dart';
import './util/enums/category.dart';
import './data/models/user.dart';

Future<void> inject() async{
  GetIt getIt = GetIt.instance;
  final preference = await SharedPreferences.getInstance();
  getIt.registerSingleton(preference);
  getIt.registerLazySingleton(() => ApiQuery());
  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'UserName');
  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'PhoneNumber');
  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'Email');
  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'Password');

  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'DishName');
  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'Ingredients');
  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'Description');
  getIt.registerLazySingleton(() => BehaviorSubject<DishCategory>(),instanceName:'DishCategory');
  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'DishImage');

  getIt.registerLazySingleton(() => BehaviorSubject<List>(),instanceName:'Latest');
  getIt.registerLazySingleton(() => BehaviorSubject<List>(),instanceName:'MyDishes');
  getIt.registerLazySingleton(() => BehaviorSubject<List>(),instanceName:'Breakfast');
  getIt.registerLazySingleton(() => BehaviorSubject<List>(),instanceName:'Lunch');
  getIt.registerLazySingleton(() => BehaviorSubject<List>(),instanceName:'Drinks');
  getIt.registerLazySingleton(() => BehaviorSubject<List>(),instanceName:'Appetizers');
  getIt.registerLazySingleton(() => BehaviorSubject<List>(),instanceName:'Soups');
  getIt.registerLazySingleton(() => BehaviorSubject<List>(),instanceName:'Vegetarian');
  getIt.registerLazySingleton(() => BehaviorSubject<List>(),instanceName:'Desserts');

  getIt.registerLazySingleton(() => BehaviorSubject<User>(),instanceName:'MyAccount');

  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'Search');
  getIt.registerLazySingleton(() => BehaviorSubject<List>(),instanceName:'SearchResults');


}
