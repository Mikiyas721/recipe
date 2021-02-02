import 'package:flutter/material.dart';
import '../../util/extensions/common.dart';

class MyButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final void Function() onPressed;
  final double minWidth;

  const MyButton({
    Key key,
    this.isLoading = false,
    this.text,
    @required this.onPressed,
    this.minWidth = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Color(0x66dff3e6),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Padding(
        padding: 10.allPadding,
        child: ButtonTheme(
          minWidth: minWidth,
          child: FlatButton(
            padding: 15.vPadding,
            onPressed: onPressed,
            color: context.buttonColor,
            textColor: Colors.white,
            child: isLoading
                ? CircularProgressIndicator()
                : Text(text),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
      ),
    );
  }
}
