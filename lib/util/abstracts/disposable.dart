import 'package:flutter/cupertino.dart';

abstract class Disposable{
  void dispose();
}
abstract class Bloc implements Disposable{
  final BuildContext context;

  Bloc(this.context);
}