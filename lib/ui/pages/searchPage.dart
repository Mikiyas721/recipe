import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          cursorColor: Colors.white,
          onChanged: null,
          decoration: InputDecoration(),
          style: TextStyle(color: Colors.white),
        ),
        actions: [
        ],
      ),
    );
  }


}
