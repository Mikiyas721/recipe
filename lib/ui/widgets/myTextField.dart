import 'package:flutter/material.dart';
import '../../util/extensions/common.dart';

class MyTextField extends StatelessWidget {
  final String title;
  final String initialValue;
  final String error;
  final bool obscureText;
  final TextInputType keyBoardType;
  final void Function(String value) onChanged;

  const MyTextField(
      {Key key,
      @required this.title,
      this.initialValue,
      this.error,
      @required this.onChanged,
      this.keyBoardType = TextInputType.text,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 10.vPadding,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Color(0xffefefef),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: TextFormField(
          initialValue: initialValue,
          obscureText: obscureText,
          keyboardType: keyBoardType,
          decoration: InputDecoration(
              labelText: title,
              border: InputBorder.none,
              contentPadding: 5.vPadding,
              errorText: error,
              labelStyle: TextStyle(color: Color(0xffb3b3b3))),
          onChanged: onChanged),
    );
  }
}
