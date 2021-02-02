import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext{
  TextStyle get headline1 => Theme.of(this).textTheme.headline1;
  TextStyle get subtitle2 => Theme.of(this).textTheme.subtitle2;
  Color get buttonColor => Theme.of(this).buttonColor;
}
extension SpacingExtension on num{
  SizedBox get vSpace => SizedBox(height:this.toDouble());
  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: this.toDouble());
  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: this.toDouble());
  EdgeInsets get allPadding => EdgeInsets.all(this.toDouble());
}