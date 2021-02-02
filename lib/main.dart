import 'package:flutter/material.dart';
import './ui/pages/loginPage.dart';
import './ui/pages/openingPage.dart';
import './ui/pages/signUpPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes',
      theme: ThemeData(
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black),
            subtitle2: TextStyle(fontSize: 12, color: Color(0xffcacaca),height: 1.7),
          ),
          buttonColor: Color(0xff20c060)),
      routes:routes,
      initialRoute: '/',
    );
  }
}
final routes = {
  '/':(BuildContext context)=>OpeningPage(),
  '/loginPage':(BuildContext context)=>LoginPage(),
  '/signUpPage':(BuildContext context)=>SignUpPage(),

};