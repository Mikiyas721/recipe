import 'package:get_it/get_it.dart';
import 'package:recipe/util/enums/category.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './util/apiQuery.dart';

Future<void> inject() async{
  GetIt getIt = GetIt.instance;
  final preference = await SharedPreferences.getInstance();
  getIt.registerSingleton(preference);
  getIt.registerLazySingleton(() => ApiQuery());
  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'Name');
  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'PhoneNumber');
  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'Email');
  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'Password');

  getIt.registerLazySingleton(() => BehaviorSubject<DateTime>());
  getIt.registerLazySingleton(() => BehaviorSubject<List>());
  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'Title');
  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'Ingredients');
  getIt.registerLazySingleton(() => BehaviorSubject<String>(),instanceName:'Description');
  getIt.registerLazySingleton(() => BehaviorSubject<DishCategory>(),instanceName:'DishCategory');
}
