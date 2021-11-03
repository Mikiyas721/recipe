import 'package:flutter/material.dart';
import '../../data/models/dish.dart';
import '../../ui/widgets/dishCard.dart';

class DishList extends StatelessWidget {
  final String noDataMessage;
  final Stream<List> stream;

  const DishList({
    Key key,
    @required this.noDataMessage,
    @required this.stream,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        return snapshot.data == null
            ? Center(child: CircularProgressIndicator())
            : snapshot.data.isEmpty
                ? Center(
                    child: Text(
                      noDataMessage,
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                : ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DishCard(
                        dish: Dish.fromJson(snapshot.data[index]),
                      );
                    });
      },
    );
  }
}
