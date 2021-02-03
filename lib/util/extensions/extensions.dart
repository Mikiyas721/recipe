import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext{
  TextStyle get headline1 => Theme.of(this).textTheme.headline1;
  TextStyle get headline2 => Theme.of(this).textTheme.headline2;
  TextStyle get headline3 => Theme.of(this).textTheme.headline3;
  TextStyle get subtitle2 => Theme.of(this).textTheme.subtitle2;
  TextStyle get bodyText2 => Theme.of(this).textTheme.bodyText2;
  TextStyle get bodyText1 => Theme.of(this).textTheme.bodyText1;
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get iconColor => Theme.of(this).iconTheme.color;
}
extension SpacingExtension on num{
  SizedBox get vSpace => SizedBox(height:this.toDouble());
  SizedBox get hSpace => SizedBox(width:this.toDouble());
  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: this.toDouble());
  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: this.toDouble());
  EdgeInsets get allPadding => EdgeInsets.all(this.toDouble());
}