import 'package:flutter/material.dart';
import './ui/pages/categoryPage.dart';
import './ui/pages/homePage.dart';
import './ui/pages/searchPage.dart';
import './ui/pages/loginPage.dart';
import './ui/pages/signUpPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipes',
      theme: ThemeData(
          iconTheme: IconThemeData(color: Colors.white, size: 30),
          appBarTheme:
              AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            headline2: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
            subtitle2:
                TextStyle(fontSize: 12, color: Color(0xffcacaca), height: 1.7),
          ),
          primaryColor: Color(0xff20c060)),
      routes: routes,
      initialRoute: '/',
    );
  }
}

final routes = {
  '/': (BuildContext context) => HomePage(),
  '/loginPage': (BuildContext context) => LoginPage(),
  '/signUpPage': (BuildContext context) => SignUpPage(),
  '/homePage': (BuildContext context) => HomePage(),
  '/categoryPage': (BuildContext context) => CategoryPage(),
  '/searchPage': (BuildContext context) => SearchPage(),
};
