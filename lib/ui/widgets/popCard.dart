import 'package:flutter/material.dart';

class PopCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      top: 80,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(0.02),
              spreadRadius: 8,
              offset: Offset(0.2, 0.5),
              blurRadius: 5)
        ]),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: IconButton(
              icon: Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
    );
  }
}
